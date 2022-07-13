Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9A817C3
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject; bh=V4t/O
	h1+hQMbZs6iI9Yth+rG2IGfjh56KMwlmHHC5o4=; b=OS7c7XJczGzmGsyfcbi1W
	M+NSNC+p46aiA6LmkAI/D3TpcgRgEMQB6rV4cZ3Fb39ET1mc7JvG7WDxwXh9vLLb
	17Hxq1XHOJb151oZgzAWa+gjkT76DGi9PQsgg3Nuwu/kxUlYw8lkFouCZ9Mvrrx1
	jVn6vYrXj8iqvw8tg39OjQ=
Received: from [192.168.3.100] (unknown [218.201.129.20])
	by smtp7 (Coremail) with SMTP id C8CowADnOmKqXs5iVM_eNA--.32623S2;
	Wed, 13 Jul 2022 13:56:58 +0800 (CST)
Message-ID: <0a56c830-9fde-25fd-c087-739da4b68c48@163.com>
Date: Wed, 13 Jul 2022 13:56:58 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: linux-sunxi@lists.linux.dev
Content-Language: en-US
From: qianfan <qianfanguijin@163.com>
Subject: ext4load: Watchdog support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:C8CowADnOmKqXs5iVM_eNA--.32623S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYsqWDUUUU
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXQo97VWBoZ8IxwAAsi

Hi:

the watchdog will timedout when 'ext4load' reading a large file, the 
dirver of ext4
doesn't touch watchdog. Anyone who are fixing this?

Thanks

