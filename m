Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795338789;
	b=wzEDhO0+JlLl+ry5D0Fnl0MsODQUuoZU1M0gZKyDDdm1A7dBVKtRtNFUUlJ/a4AKfsyD
	 rC8BbJbWyNwFBCbz7R5kZIzxKLYhl5uD8ynbtBPm8jiH/x6Ko879Erp9Ve9js0rKhEvrR
	 aYcVOsqnEYvySd1XBVf81uUKfLAQv078lPiH8pUq9ubpwXqek4aMhRULmFUxQlkZEblvE
	 UfN28dA2MwabwDCIYqDkY8dqYHrU07Dv90NE7NkBAH6f7ooyWlTHSKM8K+u3G1W+7vm0F
	 jvPx9h2Nv5ui2UURsqUa98DmxufLE1HA/DKDCv7qb3VUuEeXY2gTIMOXpFhjyl+fgsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
	b=zvhxLbn4cCteMcVAeOVuTBqb74Rf+EXo+x1S3ICIpGl1SZOz4aepjCY5bpC5++smhkT/
	 DuX5VwoQXwpmi0LNaKSl8aqPNM/4dhhg0sF2Ly0SauDP0hKcTDMFWoLLtbgbL1BATLRBj
	 rl4rLc3CBJ5YD+GClKnbjQR9AGll5EICwN4Y2rhhmW+ad4ISoD+glw/Ft5G3qGDksX+Rs
	 9pbtH2qmNN0v5QoTt/cNTL6zFuBLgovIY5K7R0zUk1pxxezdQ3GoemYINBaemLZOIWe89
	 X/Opad4hqaZ25ffyClp4DDuO34VrmotieSQAa5daEWYEa+LQABlvRY5Nk0Exp3DKD9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7BZXOAf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E714606A32C
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 09:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E714606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7BZXOAf
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adf222704dso2588131fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 01:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338788; cv=none;
        d=google.com; s=arc-20260327;
        b=Cu/MYEdnalZiPaUb/WGbArTEA9maFGHviJkSF587g30UDrpP6b8g+JnJ9BOF8t7Zy0
         owpoYDAll0z8Bqm3fnv8+W+1tD1pPT7xPcbpKOx4q09zwVGFqyjeFzn52oOqjGikWWo6
         PykcN/3N1wOTp3UEHCJ+5wulND5Eqr7yQmyh8TCAEmvBy7RwyqvgLNLgW/IOTJFUADiZ
         /xDuW96BJZqG7uIf2P9e7q13ush5qOvKuebyBt1s9Ja/9MyHdYyYjKXTFAU4NxkjmWMA
         AgvX7JMHvSimUNkQhq79swm3kI4sORl1f9hXTkdCh90V4BbiETijCmdT2kAtnqeonXXI
         ZzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        fh=2Re43X7yLe/4Q7tRJ9ofCMopM+zRDORW9IchUvVvjVI=;
        b=hUFnsB85Ja5QBGMLuR/0CWDu08UEvmT8gIAkBVmHQB+iCCEcYK+yJ9L/XO7EHKJebK
         PGpr4+S1khLw3asZLBiPw5ff8bWhCu3sJNfbnanPH7dR4AFz6W+snm8UDY6vGzVTA+Dz
         JOl2tszFyo2yKIUAOa7qr4OCArcANoPdGoW/aEclAGMt4XHylGS9GJiXg/gFRU/UBmOJ
         HP+HKDimaXPGOLVR3wwQK7ljb5RsEzynY3SCF6znrIyDKSngqzCvvgZyD/uoRVY4QEN1
         pLY1Wamg0fk3j38bQeprshyZzRxGrrfoKhAuSmigpkPftiij2n816o/p6O7E+4tc1UwT
         IqaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338788; x=1795943588; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        b=E7BZXOAfvwpCHHy2zUs0EBXN/AZT6p/Mr5QDwFSr7UXByqpINCohbsBoTRR3jVxdNb
         90SS2PhRgQypE2t6wX2q5prx/fZud0vPKw4bdAAXiLGfZraMDEOLytNBUAOwUAvnyNce
         vehFS5Ma4lseISWCOALOzv7TmVMyG6RZPZHYkulLHQJ1ONNWzzRXRogTBdbB89eh2KDp
         TWg9rl7SdjfKqdLvCcdhQXtvsLIuQs7Mw69BI//NwEkCbdZVGMh+7R+6wfvQQjwR/K/q
         b2a/L6BaLTINL8zQiich391jvqnkiHjiBCsF2karfb1vWAz2B1a9UhcVgWrVko4RwbUX
         4tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338788; x=1795943588;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8epGz59D4MdEX407F6itbh+0d06Zih6gwa0uldXtP/Y=;
        b=d6zawIIS53KtpN77Ojvo0KdJ2PxLRC1It7zbUAkYjM+DaTPVGLbkmE60rVNEfWBn5v
         koBStpCCSXk305Kjnd7jalgqLahJO9Fcj2ftvfWZACirogoiDPzGra9K45JmsqHXcE6i
         b1UA4evXtgXJ2My4ePcZtc/oCxJr/KzhNBiRjjaslAvkaRgI/vKuLFt+RKrX+9Nkb6ap
         qU+XZiw8XSGUETiy0pVwuMhrdW3pFEgDDyGulo1yOWmGxMEdPFCvUOjQZ02OS6aGVMTf
         PzEcLJkFDeldmW4gZyhCgcwERyvbvc84aro447mvES9oGOYcypeTs1NboweKSX3G1uKP
         zk6Q==
X-Forwarded-Encrypted: i=1; AL+hErG028952ELgj2knJeQpAY+79Mx9jZ7oTM4MjBVrv1MpzzCGvJT/qcAIfwCbSBiFA9ynK566a9qss0eFhA==@lists.linux.dev
X-Gm-Message-State: APuU4Z90tge+KiJEQ+k1o7FXTDIWVY9IfGhI6UNiG27yxNhuy6uxhEs6
	QaHjC0ZijMSW0qrobGPBjrzNmi81n0AtwoBbIAnVClgujLg03lT+hHfYvvdGexZ/Ea7lVg8fP1C
	5VVocX2XBTOEyWy0T4T46ys03gcjo0OY=
X-Gm-Gg: AZFdTZeIBbrTmyyXAsjkV2eJOK5IhZE0NlL40lBc8gglO5+cJWH/sDR4TO7Yv6AtxGm
	b9dMGM9iJXhIxs8X3EO/IiX3tKKRTwz2pA5dk7KqpHAE4ll7k8909cbOz0DWZPd1O0ITE0Cye+b
	ADF9mhz1MCgMpK2kC/mMYz0sLmJszf5fTbuyNiL8AB0pjVrd5AnunPHEFvZVep/1y5xrkxLpWc0
	QJlHRBqMQ3ez+tqBfD5es78EJQWOt0K5XEO1EyMQe1OfB3ZIXeKQ1pZst9XoVYIzFPHoUhWdrTA
	WiDPzFZRLM3lcfdxRJibHI1AbyTK3B2xyToCEq6+U851CMDWv1zsDZ3kkO8pZVuHEJPTr9fKski
	lVyrzXzQSSMmAOTAdmToY99PzRDbnCgighgCggix3gBDEVGmFk8DtPkxN86qauQgHH2bExZQ=
X-Received: by 2002:ac2:4c4d:0:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c308ed81f9mr799710e87.6.1795338787631; Sun, 22 Nov 2026
 01:13:07 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <7dee2bac-9892-42df-b2d3-62d648af3452@lunn.ch>
In-Reply-To: <7dee2bac-9892-42df-b2d3-62d648af3452@lunn.ch>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:12:55 -0800
X-Gm-Features: Aa3M54p83wm_hVpGZBJqvMK9Qxelv-vsaTFx_mZWuVaXR63vDKf_CE4mO6QIPQ0
Message-ID: <CAEy9hNVmG0FiYWR8ENyQjfnCKrcMrNNJtTMJLZQ226FQjQSUGg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 21, 2026 at 07:02:38PM +0100, Andrew Lunn wrote:
> Is this problem specific to the dwmac-sun8i?

No. As Russell wrote in his RFC, every core with normal descriptors
gets max_mtu = SKB_MAX_HEAD() while a descriptor buffer holds 2047
bytes. dwmac-sun8i is the only glue always in chain mode and the only
such hardware I have, so that is where I measured it.

I will send a v2 that limits normal descriptors to one buffer in the
core, with the lower sun8i limit on top, tested on the H616 only.
