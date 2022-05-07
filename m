Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCA07E
	for <linux-sunxi@lists.linux.dev>; Sat,  7 May 2022 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject; bh=gk6HT
	qYMKEhxvLn1BYr+MWBYUaZp2FEI8jEUok2zYeQ=; b=psZqR2mPDbA+h55dNR49B
	XgVIkOEUcjkRx46a9Sairy5F3Bsm2bM3cb/BfzB5QVQ5yEHzA7vDuXrAmna+VZHr
	bdS225/oRr9rqMeoUAf+GnlEjw2RmCEXIw/ZKhvLzHjSUmrrkRFpAqrQUawvuEdS
	cTDWMDrDotxCqBcdjO7QK4=
Received: from [192.168.3.102] (unknown [218.201.129.19])
	by smtp7 (Coremail) with SMTP id C8CowAAXgroOKXZijIlBBQ--.61203S2;
	Sat, 07 May 2022 16:08:46 +0800 (CST)
Message-ID: <771e3584-6a9f-af81-a70c-313c729c6a54@163.com>
Date: Sat, 7 May 2022 16:08:45 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: linux-sunxi@lists.linux.dev
Content-Language: en-US
From: qianfan <qianfanguijin@163.com>
Subject: R40 dead when offline cpu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:C8CowAAXgroOKXZijIlBBQ--.61203S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcTa0DUUUU
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbCqRr57V0DfQl5xAAAsw

Hi:

I have a custom allwinner R40 board running linux v5.15.
The system is dead when I try offline cpu1. Noting is printed on serial 
console.

# cd /sys/devices/system/cpu/cpu1/
# ls
cpu_capacity  of_node       power         topology
hotplug       online        subsystem     uevent
# echo 0 > online

Can I know is the bug already fixed?
Thanks

