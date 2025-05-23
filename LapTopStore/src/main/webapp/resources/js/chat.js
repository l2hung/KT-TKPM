window.onload = function() {
    let isFirstOpen = true;

    function toggleChat() {
        const chatContainer = document.getElementById('chatContainer');
        if (!chatContainer) return;

        const isOpening = chatContainer.style.display === 'none' || chatContainer.style.display === '';
        chatContainer.style.display = isOpening ? 'flex' : 'none';

        // Hiển thị tin nhắn chào khi mở khung chat lần đầu
        if (isOpening && isFirstOpen) {
            const chatBody = document.getElementById('chatBody');
            if (chatBody) {
                const aiMessage = document.createElement('div');
                aiMessage.className = 'chat-message ai';
                aiMessage.textContent = 'Xin chào! Tôi có thể giúp gì cho bạn?';
                chatBody.appendChild(aiMessage);
                chatBody.scrollTop = chatBody.scrollHeight;
                isFirstOpen = false;
            }
        }
    }

    async function sendMessage() {
        const chatInput = document.getElementById('chatInput');
        const chatBody = document.getElementById('chatBody');
        if (!chatInput || !chatBody) return;

        const message = chatInput.value.trim();
        if (!message) return;

        // Add user message to chat
        const userMessage = document.createElement('div');
        userMessage.className = 'chat-message user';
        userMessage.textContent = message;
        chatBody.appendChild(userMessage);
        chatInput.value = '';
        chatBody.scrollTop = chatBody.scrollHeight;

        // Call the server-side chat API
        try {
            const response = await fetch('/laptopshop/api/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ message: message })
            });

            if (!response.ok) throw new Error('Network response was not ok');
            const data = await response.json();
            let aiResponse = 'Sorry, something went wrong. Please try again.';
            if (data && data.candidates && data.candidates[0] && data.candidates[0].content && data.candidates[0].content.parts && data.candidates[0].content.parts[0]) {
                aiResponse = data.candidates[0].content.parts[0].text;
            } else if (data.error) {
                aiResponse = data.error;
            }

            // Add AI response to chat
            const aiMessage = document.createElement('div');
            aiMessage.className = 'chat-message ai';
            aiMessage.textContent = aiResponse;
            chatBody.appendChild(aiMessage);
            chatBody.scrollTop = chatBody.scrollHeight;
        } catch (error) {
            console.error('Error calling chat API:', error);
            const errorMessage = document.createElement('div');
            errorMessage.className = 'chat-message ai';
            errorMessage.textContent = 'Sorry, something went wrong. Please try again.';
            chatBody.appendChild(errorMessage);
            chatBody.scrollTop = chatBody.scrollHeight;
        }
    }

    // Allow sending message with Enter key
    const chatInput = document.getElementById('chatInput');
    if (chatInput) {
        chatInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
                sendMessage();
            }
        });
    }

    // Assign to global scope for button click
    window.toggleChat = toggleChat;
    window.sendMessage = sendMessage;
};
