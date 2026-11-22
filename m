Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795338750;
	b=ZfWnCUGVIpxpMJPfkCS+arRwFpjaJswSM6ILNT5TA1H75nwzZ4/ML4scCsmjryBJ80nG
	 ASxO3RswCL5wYPsO0pGRegcLjSkeA0+DxnUYdOjCWlg/1jP5uiNRISxaTv9j33xEt9tZm
	 95C8w9deHbqVTbGQBJ5Z/t+iBX/+afsYRccu0jVWYrjvQ2moeRa9ELyo0Zo+3tvKNQoEH
	 4LVp4EPPmltcnTa6g0T5qjNAlop7owM9cceSvFyk3RFSlKPaGgwsRuL7l8UVyN6BCgBfL
	 7E9uSlf8BF30h6lTSgX4zqjANJpxSxhW6eZs1b98WDW67D4MEScUsH+DlAJ8ptIGUcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
	b=cn3sjhWNjihscJCzNl/N+ejahHbBIbLWZ9eNga1z5zYX0U63P3JtD03iFnfzLl1o4r1i
	 TDM8hcnOD0GMwHA5W+s6CXBZLsGSVv0FlW9aOrOktUkoQICQe+dTYfz8kyQpWzp2cU76V
	 3jIbFMkHzQ6YF8XdK2fTsXVg4pJPiTfm15uhMmP3MFvxb+2EluaB4a2d1YKbXDmseeFkl
	 7glfgHKZISfUJWaPYOTPXAfFm9BXCaPdjcBvOX6xVyo21DhMPssEORUYkCJeFPte3UtlP
	 YdWfemgBewMRFxwz/zcIIEWCrJpLh+BP+4Wd8tdjgbCNIcBueaI3oUmSctLi+QxErPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=daE91dg8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3E606A330
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 09:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F3E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=daE91dg8
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so198102e87.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 01:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338748; cv=none;
        d=google.com; s=arc-20260327;
        b=GDuAqokTIedaOZ8QWBBLQwXSgb+nb/6Br7hsNcVUUQkQUMahkjBarB9qQwca2fJuCO
         PvK/3+RZ5YrzEYt2pxn5TCBjMKZG4asip0fyrhebsx2+vu6Q0d/6cdaqEbr+k2wdU1Xp
         S6h5GBKUt3O3LjIyugw/lCsHBgZRAliXXePGq9EvyC9K0qQL2C2E9bAEpt0t58n0NC/A
         CvN6CjiCkD8iZXzn24Tm4Naytfe1ClJC2YZaBxqYiZCYbxNw2E8Nx9m9D54OMF1shsxw
         vW43stbuf3TWgSu3rdznVd05r8DTfTki8qThdj6CE5HbFuDDlyyyYdfjHvuyZjdEGkwC
         lfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        fh=a39MftCqMZMSx/qVaMJZn1ZXeixMCAzX0Pf84EiZMg4=;
        b=JsLt1BwF4Nea2IMcbUOFuNTRUDBRv2blwSdRAZIR2p0RYq9Lat9Nj4qwhyQkS0C3te
         fHJpLt4VYoPlcVTvScSody9WUV06faVAqeuCTGJjNdruhXpzndSLV6GwYYCNab505GMX
         ytRVpXViKF8JAEeu6F5Vjz8RvObC5bsyIeIYmRcQE+gS9gap/4ZlMxAzc5/eiUgLd7UM
         3XKMSDl/m40dg8oBTYorS9EevPVMJcUatWjxpdB04iDQPHsPYE69k8XP9dlJy1USbtTE
         2UambxNbYfS5wKslHrB9kd0DuGFyGHWZ3Euo/2EFEUsxDR6ZoDxvnIK76GRF1+rZIIf0
         jGvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338748; x=1795943548; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        b=daE91dg8q6GpAgRCIqZLzaiFfGzw1Tpa3XHSNnmuokSYeelZ9bWTyOd/0iQ2573ww8
         C+E5sGwvj4vHr3JSPrQeBXBGWIUKjdqLqnprocnFgMDhfW3zJtnRCeYLBI68c0jmd1H5
         y/z3+fN8hAo/csD2XgJwx+CuH4r1V1xDRmQlDuNOxh3zsROQU0ONWPhmdLbUmNZ2EOvR
         HE/eUqmVaTTayu0WbEy7bR3fmwUjZACi2uhf0yW43b7HUF10D80X/elQ+k4xIB39w3h8
         y85xvpIw9ZkET6zIPa81kOqpy9cbHF2Yv034kvyuP3glNKM2qZbLFKahcy1pBEofELuM
         SZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338748; x=1795943548;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        b=zpZlEdxQ3ncxSBfajjmM0ZvmQ0YQKO5FlE7V2DbuviLCM3EGHarQ9xQC8ke+6zu/kt
         vmKz8mFyDM2Tza9qNHtAYKGCHHN8JxbNLDL+KAbG6xKQ4goGxMMWOA9GP4PoHfKfOJeR
         gNi3mwq6SQDDr4df2+rRrBGpesuVdJ2IAvjVeEpSI5iOegDD8JZGaq1rR00BbYHav9ya
         VDshksMVjF/7RMt9lbCD8rMz3nvjItYWpV11p0ySZAPPqz/yzmEA8BDGEEzQxoFrs+Uf
         NE0drOfJi5SP7oqBsWVDiBHkLI6JqKwqzZN5yApFHP1kjhpB/1TArNeH1UdItmPxTRab
         QN0g==
X-Forwarded-Encrypted: i=1; AL+hErFvsXvvSfXB8RSdswHcc7xQBzmEhb6DO327VrLFglIzQy/gC7oAIBdtS7Qd2Btg2WiGEdvxnwYr4X83gQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8YxlTGU4cqNfPeb/eUGKutTjE+MncmCdoJ+g87nFLKfMf019o0
	SmVKyPt4VBrN1mX+/YVJs5R5Zv/V/wuXGEOwX9j9E2PFz0qTpJmsBmdp8lpUgFMPdgs5F2R7/F9
	O/Ie+GopZC0ArYEOBFtqdVjF69W8XIn8=
X-Gm-Gg: AZFdTZe7eJR+dC3GBO33UCq5vPsw46/dfKfajeqYwXjoWXS5aI4HDLE3KJODtqp8HOY
	KN2TWEp/+lQLtfkZS0P22df4SFiV7CrDarKe/gsyrS/36pyO6+3wFiHTI8BLsfFmVNDXJqBn3Lc
	9+HYj8wC9J98aQCCN+A6eQL1f2alWQsOo58n0CajDUGXtWAhkyWVtARFf4EVbd4/WxbM40aV2DI
	erYGVZ83rEOqZzzCmXfcHmRZnI/0Hx3mDjTHuvZ6B79/+UI61kMVODjww4BWHRVRQF26Aj33Jt+
	wVP6EQHHQ4bd8R6KLnslSZ3qec4d6jR0GNbwe5kKcIwY2frNdgZ+BzQ7jDJ/8gg5g/ghVjZh2b8
	6ioG/FT2HoPLxuAhMmYdgeZ5qDBE+/9Uj9B5XfH5t6HuAb66fg/fK6Z7V/fAKNEPDyMp4pP0=
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr3276447e87.2.1795338747873; Sun, 22 Nov 2026
 01:12:27 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <e72505dc-f20f-4473-98f2-52161e08c89d@bootlin.com>
In-Reply-To: <e72505dc-f20f-4473-98f2-52161e08c89d@bootlin.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:12:16 -0800
X-Gm-Features: Aa3M54oySI-tTJ0Yq8ZA8YifNr7RX6205w52YmRPUl3JnSPbZIf10o3azHoDuPs
Message-ID: <CAEy9hNVyfNZu9R-2duqwFhYps9t58CwZM777yM7AmU0rcc=dYg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/22/26 08:56, Maxime Chevallier wrote:
> The problem is real indeed, but not specific to this glue. Rather, the max_mtu
> computation should be fixed for normal descriptors altogether. Can you work
> on such a fix ?

Yes, v2 does that in stmmac_main.c, with the lower sun8i limit as a
separate patch on top.
