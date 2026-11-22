Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795338709;
	b=nqgi0VpzBQOrD9ZbgOUTlLJ+kzBZQFKvVcKw5zhfTLaqGOOhHVOYOWeLjpOW7iuPV/yc
	 yq+Fy+o9xqrMbEf2fpCN6ZoJuRSxF7oyD1XzEIWodiL3mZAI8EyMDKodGUM5CixUaAuYa
	 A3aSXXmpbsmMM11CjCty3HZnkdmdP/Ic7LN35AvtugiDCcnbNLmcgOSlL7mnCUV7db0mz
	 UkAI4vra51ehiMgvNrFWlWcsw+kcyPmsiwbeNJJ9YNKS1xqJIyN0V8hr2vPuZi2zCzFD/
	 FZiUUhBXYeFfHduf/EOZPAp0dtNt8obvCqJbErtPX19lTFV4xBSokkSBcaNdNharU0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
	b=Xef+ZuClUp4fXHt23VhMtJKTSQlJ38NK6hYzn59w4ihzdGtGIfbg9VzNdY1JKLxJ7yct
	 hbaiOFMnyxPS/Rb6hIzY6jeWgAl0tKKuzpfmdw/SF9JAG5/+h3sJ2N8pM3J4kpW6TCKM0
	 g2n7Nars4n2rauMI5ig3iaiIr0RRUupymJUsL41rGsaLCU1OoE78nqJ5kb9hS5qh33SFg
	 HH1A3LGIsLL2kS3juVtfu8rbRJwzbp2KmsX33a0J2uu7Gzkmv4Ag3+GQN6N203Tjf5lq7
	 a7qtyhOQ+9bd/QGv1Oiu2gUdMxujeP9gN+kLClne59sjHM8ldN7k4S1xmw4WF43/Ptg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sN49mZ1G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44424606A330
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 09:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44424606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sN49mZ1G
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab1e5a01a1so1803041fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 01:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338707; cv=none;
        d=google.com; s=arc-20260327;
        b=pO5Z8SmKDoTicVfgcAC64+OKZagsDXVI5tqyZ50CcKrbOXShGh1xDmjSl+yCZC6W5c
         W/Ky/me43i9k5pJnIBnMu/1sviFFcufPuZgS9QXG8telfAHfFB1yU7tFm5hsSBZo8Tah
         XtAlwoIykEjN5p5IOB2ARDTKfsxJI2+aivLSNFSJE/FmOY+UrjgLvAM1utYCfj1t6tVA
         Q5bYSDwQg9+pano5i33TZ/ILQ6r5X1QwJBAy/KQjRIrOajhq+9jqhsH7PGiMUkPG5jN5
         yMuG9oUhjVI1AEIs/hJ6xJLLZaKtJ78XLWUOSyV5GYhep0tJFgS/+W4lQoNNN5AyoGkY
         54UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        fh=pl+YOPHXv/JR7QBfbSofp5aLMAPQlSF6Zw0FK/f3B6A=;
        b=DiWhqkJFWQb5sniNjPDM4zO3kjmDuZnYzzTVdE1F0bYM0rctO0pfCErX9ycpfDUDps
         DG0mIDSsadR76AQAr3CecFK67R+W3KRoRVco/s7mqUJbUgVjKVR5VNhnN09JlwZAWJSZ
         ITFnp+ogT/ApHmp19cg10ATjr07mLWrFbFkRPKUjT3wXNHKhxm6w2xc9oy64KPMFWZrX
         u7HdJVrafZDz0/qXh1q9aGVXnfYmOQn1LkgEwQnksbDxfyMODi8laHT/kTF147SboxFr
         pDVqkI/nyJEusEtt7e0zjV0/Y0tsXRBQF3PPay1u+9icngv5G6Mx7K3KZHAlRMNvnG8d
         ODzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338707; x=1795943507; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        b=sN49mZ1G3Kgu/l5UhAwbcscYLuG3le7PtbNDQpw3nGk/srl1IYOW/bVAarWYUkRIHM
         9dTrXu18B/kZNnHXFTFgLiQmHxiHMeoe2uUE4MCuP3QW+HQTrVwA28mSDkJ4LIC1dNJ+
         ZaY73ShnGrwgheGnzaNRFqOXGJKTKDBmdfxYIVCjwcijp65+GfJh8ToF1Gf8ykUx9QKk
         h+HE15gKzGf3VFn+Tl/2OMXFzKcqyrlEUlsH7XxF1Uc2YlcJluMm/2qS+bJwor9s45Xj
         SaVjfyT4aKtt8hBSI6LzEXnXqQEodrjAVwFN4YBS+ll4MC6hj/cNlXm92bkyZQQtTFDn
         vs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338707; x=1795943507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        b=g4FbFD+Z2N8HzJtlzctKBPkEtq3Oq4q3ezpYp5EHW6+f1Sr++vBT3d7/1sI+JTPNsi
         obVPPdGZoLLxAIbJTlWGkRNGuOQr2DRfM8WRgER3G0OKdZ0SarVPifXNu3Ao8XR3j1l2
         YRWglqRAai0XG31WT/MyL8g8Orm1EezeMnN7r7CeOarp+1H62qZNbxhooAFkiPIy7Kw3
         1IMRUBIntJviaNPrMHCKq2LOFlFQqZl2YvmeHNMcsr0l5pWkaNfiUNIiizOB18WUq3FY
         jS8AvKiAzor1+oLG3DNcAd0jCxj7TQUf8/Wib1dIj2Y6Wnx8+PkpXog/85J+BYrYbHli
         /oIg==
X-Forwarded-Encrypted: i=1; AL+hErEu/M7C8bnjdVQDfy5YZE08BuzBeG8j09Uki5jMbupg9Y7zPFgsqJHF1FMWEVxUn7bS2S7RukotcK3rOQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+rANj2jAiEnQRZWj32RUDmaKZo1gxrzjp5jxIR/fLHjpamVyOa
	mL+PAdY5y37er/d3kv07L8fARIPJ1GCUwAe/IQpHcsSHiMIAIJcZ6qlhzbumpOFTh+S0V7YCB60
	ncGXmbm6c7idP0pTiadcVuaRYabHYxvE=
X-Gm-Gg: AZFdTZfHS9x8J4mkRY6NuRzPQiUQ0csm6IZ9dxa4YE+baeOyy0wu8/qnvcxzfA9IZco
	HH5mSz/SjNDVSjzE/JgTZdfl7Cny2137jvqETfeoBNTtyjsoTnWbhwvPyGO1mHgF59sovAA2yeo
	isI50SxU4g97ABLFvox1OO1J2rFtskLieWgoR9ru4p0kD6ScYGj4zQGMTzN/RGB8iWDmdx7VWjh
	oZ9Utx7JHzFYDJYLZDVDAtoAXDwFZFyaeJ/zGyNv7B/Rg4w7+canCgkONFrX/egfn6CXcpm+nlA
	o09024vBNUl/nmktHY7qM0Wx5xEez/2X/zmKtPnS6xtZGvnaf6QkPwDD3yCNnF8ihjilH8hLlKm
	x4aqh9vRZ6/P+VzazQLkXWliB42IuVr+QW3decmkzBoENu2Cbfd90NeiglFsIc7VoyJhSdlx8
X-Received: by 2002:a05:6512:4382:b0:5c1:57ce:d4b4 with SMTP id
 2adb3069b0e04-5c1bc75212cmr2114507e87.2.1795338707138; Sun, 22 Nov 2026
 01:11:47 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
In-Reply-To: <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:11:34 -0800
X-Gm-Features: Aa3M54rEVKMx6Ef6xvJSXV2IbIddu5RGXUJDnGgXRbNUM1fhz_Gu6V3X74W1H_Y
Message-ID: <CAEy9hNVJ5NzKQ95gxN6UWxsgy6HFMMFxGYZ_sutmdb0gL3qRbA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: wens@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 3:26 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> So what's the overall plan? Limit it first to make things work, get the
> fix backported, and then fix jumbo frame (>2K) handling so it works
> for any MTU value?

Yes. v2 for net limits normal descriptors to one buffer in the stmmac
core, with the lower sun8i limit on top, for stable. The jumbo series
then goes to net-next on top of it and lifts the limit for sun8i:
https://lore.kernel.org/r/20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com
