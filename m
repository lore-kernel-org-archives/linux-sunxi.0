Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794972009;
	b=GIYYQolpJgkR1VDf7fHlP+r4cdwww+RmrXsg1oVh4lC81o+QJsFgCLFWt+jpkkj5kVys
	 yQZjr8gmjYQ6AsuRRXvZkGjdyaHjYy5p1FHf7dvGaeLR/ijHpTiefqDqGa3uwg8LAJZH6
	 4q7GdniVNEGwM9cfrDo8RVoTWIdHg6AQnkcnL5vNSHdRnLFm5WyMH4lwgq1tLEugFZJnd
	 JcMa7CtUTn7LV1yJkvlKR54dKISDGcrvsBKn/D8BqR3KYioCdjsfUwRvjeapFcljxh+1f
	 C7X04nOPFHQ4MZtjshzELX3Vlr8wHyAxFjZz3MFSbYIOwYImzvIfWV/iW0mYI4S2XFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
	b=bZttN7+P5F+AQov876jSnMUExz3I5fzegw1QWNr11HweTpl8JrKFqf/pMVqdFqVmGcG0
	 0g/HkUJK0eEHOxJ6UG+ovO22VJ7VJupl50Z/7YzfQC6qHd8j2uPz5HimFcTAkAL1sYtEp
	 enb+4M5mpquilqFVw1QZNLSSh/YMtuX7BykZ8m/c7dxL8TcYfBdQazglw7sxVBmHzoSzT
	 XAM60Vk4NoihrY5YYqsjH55zPTw2/9rqrf5/ERkFXsmqDlGkpfcLFzt9C5VV1GHMqrCJs
	 cdf/T3TSpENzAi1v72wNL32K94i6fzw4neW52iLvgFc90eDVe06Bj3tSIcQgTcMY2hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgzdrw6q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE42606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 03:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgzdrw6q
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae3b5b1027so696841fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 19:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972007; cv=none;
        d=google.com; s=arc-20260327;
        b=dIi7uv4EZN8csZqWX7PxZPlMXMYT3RtthBD07DKebU/WEcZEwJytr1db2jinJcWy94
         sR65cZULLwhvoikRK2H23K/yvO+QOg9CQ469SzEw4jNoWujkFQ1f+njDw0Ub7KDsMCkG
         QzOP4gUfOlFW3RLynierudiASDRnjYxaqmZVRJs0Kw5ImtJVl5BLZVOu7XVAoMEPl4c0
         M4fK0J5uZeTX/B2dK7v9P7BiI8ACoDK3p/G4uSSqechMCc3yHYlomUy13v+WshsZ0LsR
         dKXykcOqO7Hkoc29kklr6ai5BLwsF74gVA8hT3uk7ZUvavmAO0Gznlzflk74nojKbyUH
         K1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        fh=4ohGpIjnjr/jYsa3UjAzZuW70BEOUfS/skHJMrI5LuI=;
        b=Dg7zDyyVfoHi/6SHGxVwz0Gwj/OVmFNLGz4VTMCoy+Sn8+2qPwMyXYrR7qgxXp/wFH
         X5HVBumGm6mRP48F7Ej2KKw5xaCqfDLs5ncDESqyKCdXCRNy3hN2VPV68mSs2n2IIcOj
         jYCujl9jnGNOf3MTg4TUNIia6wmCcR/VRSsbJ3Urd4x64XRkTh6v2aGArpaAN0kwRLTp
         Iw8d9L0sFsv774cxuitVHwxHyYM0vGqs25QG5GjV4m1tuLsclneitmgib/inItvdLzoC
         HPVNGZDk01tmYuwWKtEhX/lZ+KPN1agoboCQ9N298K4Fn7vYzfGTcUxAgLPBeOXMmDkL
         VCNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794972007; x=1795576807; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=Mgzdrw6qwKntBpP3Z+nYLBLnsILBs/5bb9S1hl7sWs7vPT4bsygCxxXHGg+PGv1VEL
         zjDD2KymbtQpx2cW11Pkd+YodYrtIrC6rSTHuEzWSKJ6m/RzFYMiHmFAdm+tUGWrUPl2
         JeLNeCh56kSCrk1IXnEeVm0UPvlf0LAs/2ELDYkOmvZCHD1m+Tq0OEQerdApP07Sm9v3
         gGgJqPIzvtUBRtRn9wOMbwpgGDcwyEZo/dsPyep8gG1CnHlTPl1b840hXgSH/ZlwtVVM
         3oD1nezOfudbRExJKCet+oJOH1eglbTBdm76UsWp4RHjMR9dBJEPYoXxbZxp920UzYh7
         GIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972007; x=1795576807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=QXfgJ5M6BM+UtepdcNP5rNH7kvs8N8O/62cCdHbiIHfCfPytTB6IDnqC84b3lEB2wQ
         7XngfykyfYaJQ86UD2kc1aFjzpJZhb8OrBkC4UN0aJ6FpsuHz7Eaiq3BIcfiyMFUf8BQ
         pKgMIw7KoNqhvHLAfqLAXp9sCmYEbThLDpKLEEUhLZTtHAI8UJZk4LenhHEcB12RYcn4
         MPL9Z9mTaZkQ8BiIEzKo2dLruHlxzM5Auw+bnWm+uTRPdSpug2uZYLUAT2vBfxJgXcYF
         6M+772101Gq9WchWGGHSnWP7xddi+S/QBAEU4f6n0VBeTFD25ga6Ys4MBdRnIP17T4jA
         DJOA==
X-Forwarded-Encrypted: i=1; AL+hErEIAKWubgWByXa3udnh+Dev4RkujsLuxWfEm8vJUGGcgjSEom029dsP/KwT2yMRf+lxFN1GtaLdByx5Vg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8GZDAIEgIwSnwFH95xiZUxfSm5WEBoi20a/7L5t3v0n+j9KO1v
	Zh3mdhjtf8bImaeB4cu5cH1Hh6zOZ9TkY19H3wtBi1I0Spy79LaqV8/x5JbttsvCy1JNEJl4EBu
	0rBE1MQ+osYz5jh822TXYe2a2XGEM2zU=
X-Gm-Gg: AYBFou1wGY5GSk4x9zALJvfG4ilWkdMb98n/PNc7dx4WuWwJo6hZiiBc1zPH1R7NouH
	qnI76BHfQBKFfYQAqksTaawxw8VpPUksKEdOa5G//cMcPOE+gqSl0TCok1oR9TYvoVGBE5n+GbB
	f+4Uf6xWp9gSaS8rb+ypyeo96uM9goinS/ITAJ2HrSwe5o9UHMLAcv5FErDLJAGslrniNOYbUaA
	ziNBGXJHX7eqCUTui8XLYlBW+vRS7R2Tov1ZcyRuRyuxUZd5QBY/MTpTrW9tT5y4bAQd0x6tTRK
	s0k+y/2ngIPtupIaF3XfhOnzQIid+aNnJrif+r/lNISY1ezDR2KtVjja8VdNVHq38pMO2S5G6JC
	8pRsirghgJrpHpm26lrQVejYFkapLxowRxsFDeFDXLa5osDNH07zysn/zlWN70tNu+x92XfSxWK
	Rr8S55nLWRgQfFVS5k
X-Received: by 2002:a05:6512:1326:b0:5c1:4e17:1ed6 with SMTP id
 2adb3069b0e04-5c1aa2d9e10mr388793e87.6.1794972006813; Tue, 17 Nov 2026
 19:20:06 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
 <179490321548.3136.12535368591168637116@kernel.org> <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
In-Reply-To: <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Tue, 17 Nov 2026 19:19:55 -0800
X-Gm-Features: Aa3M54qlIUAd0hNudODtwjUM3vp3szpxLVn6rqxVCrMmIBzKBehn34SS0rG8Tt0
Message-ID: <CAEy9hNW=h41aoAaBQJzL80X4BgMM=xQe6Y4_sR6jw3RWBue0sA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-sun8i: Defer probe when the
 EPHY clock is not ready
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, clabbe.montjoie@gmail.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

You and the bot are right: get_ephy_nodes() runs after stmmac_pltfr_probe()
has registered the netdev, so the deferral comes too late.

Yes, the internal and the external PHY are both behind the mux. stmmac
attaches the PHY at open, so today the mux is registered only after the
netdev is visible.

It was build-tested only, as the notes said; I have no H3, H5 or V3s board
with the internal PHY.

I will drop this patch and move the mux registration into the MDIO setup,
together with the probe and remove ordering that Chen-Yu raised on the mux
use-after-free patch.
