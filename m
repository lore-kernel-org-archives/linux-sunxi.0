Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7F781D
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 04:44:03 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id E86E020106
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 04:36:39 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 1B640267D1
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 04:36:31 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 777773F203;
	Sun, 10 Apr 2022 04:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 6FBDA2A36A;
	Sun, 10 Apr 2022 04:36:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZDf8wxZCuF7; Sun, 10 Apr 2022 04:36:22 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Sun, 10 Apr 2022 04:36:22 +0000 (UTC)
Received: from [127.0.0.1] (unknown [64.225.114.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 3BDCB400B2;
	Sun, 10 Apr 2022 04:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1649565381; bh=kW1OAaOiLG8f1uFz4WvtBbMUuxSvXuOIM+eTg45LRvs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DXVaCMPd112sKvhdTGLUoz+vCxksJ2dhsaq/5tEIFYa85FFl0waCN99zQT8QZNAhh
	 Q3EggIjw2Gza4+mQpfD5GnrNPKfGqoxd6ywo3VMlnc0qCwlHN4HHt9TQouY+0x4/zg
	 WUPAbtq7+PFuGUP0BkJ/ECvWUU5L8osmFiJS6AWY=
Date: Sun, 10 Apr 2022 12:36:11 +0800
From: Icenowy Zheng <icenowy@aosc.io>
To: Samuel Holland <samuel@sholland.org>, Evgeny Boger <boger@wirenboard.com>,
 linux-sunxi@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yangtao Li <frank@allwinnertech.com>, andre.przywara@arm.com
Subject: Re: [PATCH v2 1/1] phy: sun4i-usb: fix phy write on H3 and newer
User-Agent: K-9 Mail for Android
In-Reply-To: <683de674-2613-a96e-2831-7e3172c0f9e2@sholland.org>
References: <20220111165153.63632-1-boger@wirenboard.com> <20220111165153.63632-2-boger@wirenboard.com> <683de674-2613-a96e-2831-7e3172c0f9e2@sholland.org>
Message-ID: <12624AAD-9989-412B-B7EB-5C73562E804E@aosc.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E4=BA=8E 2022=E5=B9=B44=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
2:28:25, Samuel Holland <samuel@sholland=2Eorg> =E5=86=99=E5=88=B0:
>On 1/11/22 10:51 AM, Evgeny Boger wrote:
>> We noticed that USB hosts won't reliably enumerate USB HS (480Mb/s) dev=
ices
>> in our custom A40i-based design=2E What we observe is that after severa=
l
>> attempts USB device would fail to enumerate on EHCI port (HS) and will =
be
>> enumerated instead on OHCI (FS, 12Mb/s) only:
>>=20
>> [    6=2E368009] usb 1-1: new high-speed USB device number 5 using ehci=
-platform
>> [    6=2E818008] usb 1-1: device not accepting address 5, error -71
>> [    6=2E823868] usb usb1-port1: unable to enumerate USB device
>> [    7=2E308013] usb 3-1: new full-speed USB device number 2 using ohci=
-platform
>> [    7=2E575045] usb 3-1: not running at top speed; connect to a high s=
peed hub
>>=20
>> On some boards one of the ports would work in high-speed mode, but
>> on most of the boards all three USB ports would only work in FS mode=2E
>>=20
>> At the same time, USB work flawlessly in high-speed mode in vendor kern=
el=2E
>>=20
>> Looking for the differences in USB code, we found the issue with USB PH=
Y
>> register initialization=2E Basically, USB PHY driver sets a couple of
>> internal undocumented PHY registers to the predefined constants=2E Thes=
e PHY
>> registers are accessed in a very (and I mean VERY) weird way by shiftin=
g
>> register addresses and values bit-by-bit=2E This access method was slig=
htly
>> changed starting from H3 SoC, according to the BSP source for different
>> SoCs=2E
>>=20
>> As a result, mainline PHY driver won't set these PHY registers properly
>> resulting in unreliable enumeration in high-speed mode=2E
>>=20
>> We don't know whether this issue will result in broken HS mode on all
>> affected SoCs or instead the A40i is an unfortunate exception=2E What w=
e
>> indeed verified, is that BSPs for all affected SoCs write these registe=
rs
>> properly while mainline kernel don't=2E We also were able to reproduce =
the
>> USB issue on a couple of A40i boards from other vendors, so we are pret=
ty
>> sure these registers have to always be properly set, regardlress of
>
>typo: regardless
>
>> a hardware layout=2E
>>=20
>> The proposed patch is tested on A40i-based Wiren Board 7 building
>> automation controller=2E More details are below=2E
>>=20
>> On older SoCs (prior to H3) PHY register are accessed by manipulating
>> the common register for all PHYs=2E PHY index is specified by pulsing
>> usbc bit=2E
>>=20
>> Newer SoCs leave the access procedure mostly unchanged, the
>> difference being that the latch registers are separate for each PHY=2E
>>=20
>> Additionally, accessing USB PHY registers is only possible if phy0 is
>> routed to musb IP instead of HCI=2E
>>=20
>> Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
>> R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs=2E
>>=20
>> On A83t, H6, H616, T507 and probably on more recent hardware,
>> these PHY registers are not used in vendor BSP=2E
>> So don't set v2 flag for these even newer SoCs as a precaution=2E
>>=20
>> Signed-off-by: Evgeny Boger <boger@wirenboard=2Ecom>
>
>Tested-by: Samuel Holland <samuel@sholland=2Eorg> # A40i, H3
>
>I tested this patch on a Banana Pi M2 Berry (A40i) board=2E My board did =
not have
>any USB reliability problems without this patch, but the patch didn't bre=
ak
>anything either=2E So since it fixes USB for you, the patch looks like a =
net
>improvement=2E

From=20my memory, R40 OTG used to be broken=2E

I may check whether this is fixed by this patch when I am back home (I am
trapped in Shanghai because of COVID now)=2E

>
>And with Maxime's comments resolved:
>
>Reviewed-by: Samuel Holland <samuel@sholland=2Eorg>
>
