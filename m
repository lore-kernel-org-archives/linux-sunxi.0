Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A67184D
	for <linux-sunxi@lists.linux.dev>; Sun,  8 May 2022 15:25:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPV6:2001:250:6801:5501:163d:f2ff:fecb:5632])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id 5C89C1C0243;
	Sun,  8 May 2022 23:25:27 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: Re: [PATCH] arm64: dts: allwinner: define USB3 Ethernet on NanoPi R1S H5
Date: Sun,  8 May 2022 23:25:05 +0800
Message-Id: <20220508152505.7762-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4393725.LvFx2qVVIh@kista>
References: <4393725.LvFx2qVVIh@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJOQkNWS0JITEsdH08aQh
	oaVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTY6DQw5UT04KgwZGkICOT86
	EAMaCjpVSlVKTU5JS0lITklMTE5LVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlL
	S0pBSU5LQU1DS0pBTk5LSkFKTUgfQR1JHR1BHR4YGUFOTUhJWVdZCAFZQUpMSE03Bg++
X-HM-Tid: 0a80a4468858d993kuws5c89c1c0243

> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> > @@ -21,7 +21,8 @@ / {
> >  
> >  	aliases {
> >  		ethernet0 = &emac;
> > -		ethernet1 = &rtl8189etv;
> > +		ethernet1 = &rtl8153;
> > +		ethernet2 = &rtl8189etv;

> Additionally, it's not a good idea to change order of ethernet nodes. It can 
> affect mac address assigning procedure in bootloader.

There is no eth1addr in uboot, so this doesn't affect the mac address.
The network order in the kernel is eth0(emac) / eth1(rtl8153) / wlan0,
so I think it would be better to change it this way.

Thanks,
Chukun

