Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD181FA0
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 15:00:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [218.85.118.195])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id 694CA1C0545;
	Mon,  9 May 2022 23:00:26 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: Re: [PATCH] arm64: dts: allwinner: define USB3 Ethernet on NanoPi R1S H5
Date: Mon,  9 May 2022 23:00:16 +0800
Message-Id: <20220509150016.181735-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220508152505.7762-1-amadeus@jmu.edu.cn>
References: <20220508152505.7762-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpMT01WGBoYQkgeTUsaHU
	5LVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzY6CSo4FD0yUQIvMUg3MBFK
	HzlPChxVSlVKTU5JSktDT0lNQ0lJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlK
	Q1VDTlVKSkNVSkJOWVdZCAFZQUpMSkM3Bg++
X-HM-Tid: 0a80a955fd39d993kuws694ca1c0545

> Really? I don't have a board at hand to double check, but the code I read
> here says otherwise:
> https://source.denx.de/u-boot/u-boot/-/blob/master/board/sunxi/board.c#L791-813
> There it checks for up to four ethernet aliases and assigns MAC addresses
> to them, using the index in the lowest byte.
> So this would change the MAC address of the WiFi adapter.
> Am I missing something?

I'm very sorry for this, the rtl8189etv driver assigns the correct
mac address to wlan0, so I didn't observe the mac address change.
Sorry for my misunderstanding.

Thanks,
Chukun

