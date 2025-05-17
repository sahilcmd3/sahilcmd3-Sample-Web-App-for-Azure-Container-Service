document.addEventListener('DOMContentLoaded', () => {
    const statusElement = document.getElementById('status');
    const checkButton = document.getElementById('check-status');

    const checkStatus = async () => {
        try {
            statusElement.textContent = 'Checking server status...';
            const response = await fetch('/api/health');
            const data = await response.json();
            statusElement.textContent = `Server status: ${data.status} (${data.timestamp})`;
        } catch (error) {
            statusElement.textContent = 'Error connecting to server';
            console.error('Error checking status:', error);
        }
    };

    // Check status on page load
    checkStatus();

    // Check status when button is clicked
    checkButton.addEventListener('click', checkStatus);
});