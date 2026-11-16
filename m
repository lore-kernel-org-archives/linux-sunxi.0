Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794795576;
	b=2BQuBXrK6eWyhFS/3Gd9e99qLCXzldzjTBKx4Ml1S+SdtKwYqqT3+g8xMLo4su0FJkJo
	 Xkns6cCpAiWl5ooK6EhI+3noIhOy61G47+nea02UAi/KjmHQeEKtGL8PSdk7zGV2sC6GH
	 q4Sc5oG6dRaBz6TnNE35PxXEeSm4HQ5onk0VJ1cic1s3Qr52eqeH4yRBYdReDNO41KyAv
	 xkBXmjrLNPO9mYAV3rPw29Wx8O8RVzMcGG5anUrKp4W49AMwDonhJRTQy5pJ+9vvFwkVB
	 TP1ioUfiEX3D0FxP9OWCHhfLwqcWMbt/SYr72mk8QLIxyzBTwFRpVm1grb+e/mFFggw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
	b=hoatKvNPRINRbbfcIBCsSH/u+OYXl3HVgnsvTDrV+QmZBHYvySE6ZcNGn2OWbLw6Fp0F
	 54V6bzguumSwmZrCx9pC5PdIXTj5VB4TTB7ctIEH4ouYz7946AqVclTZhHo8XnXYFhIeR
	 Xg8X9QemznyHSggfIOtjqgrzQSPOefIsd5G9rMGd2ZA87dbmCq7NrOMez45l9pOVg3XZu
	 ZOFS9viY3RaGRsyubBpjlARjIte3m7m2Ynlho4DAuDHTAHV5hMYpwSD7F9bcCmHB7mhCF
	 cPgBJBx5AjoO9iztqhO9DpYbuv3FQ54Uy/UNMwif/WIFbDu/yMMxRvift7VoJnCWuTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY8xWeXL;
	arc=fail smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4E606A321
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 02:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD4E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY8xWeXL
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2f4cc314eso2683704137.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 18:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794795575; cv=none;
        d=google.com; s=arc-20260327;
        b=P7dN8XrJ/ZxP+Tu0CTqyzLgz67n/4eTonpoeeycfY/7VmAoJprW1SXVeMoVeHIZraP
         vdgXcPRx+VzNceMwLngYH0nEqkRzRPhHa7CrevejuNhwFAP385IXOgcbBKJdwaK2MJdn
         CJB6N28M7VJWtQ2wMojFCNEaMXtmgLjduUEWPow/ux8zvIQwjkQeU8j5LFbU62KdY7q+
         fpgwxhO1VfwT6P/YMrpvT3p67gcQVEVC7bN23zaiwpWWF5XSpokdGkF+0OLkQ3FVdDK2
         sQ5sR9FVD3SNpuIFxw/hCQiVfxkVrE2gDTRnw8cznA9HvWsrpfcSwmV/y9N0/g6TZYcd
         RC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        fh=wLXbMbHz2WGnEApn/RTTcvSmn/XJorODMdJOpEzcD7A=;
        b=pqeZPMSCuqf0uQsKlntR2RS7OrIEiTJAESTSBuFbz3Xj3GmyEwpThdMSmPFEz93g4o
         y1pr17HRcsIpkfHJY+m21nrxkNeF882xSbIdxC1o9akrauVb0OMXuqV0yPOWHjej1drD
         ZJqdzAiWKrJM9wQXQ0zHyoP6HFuXZmAipNqz7PkCHSJfJ6jMmuZnXkEtuN2UcSUIlNU7
         XWHPJ6Y2LsQKfPFS3CIqMkzjfVcozZD0d62t2NYVoW3Egh2JznTut2ZVLxKgY00jv2VH
         b8AmKRpViC89ZaLWj5Di4WId5t58BIvUA5XtWbm+CX5p8cDqW0pSq+KU7RuoTlVDkCWl
         utfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795575; x=1795400375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=eY8xWeXL/aKFgll3iq02ylOD/SRz+91mXhhAeg6eE85Ek81gV2E2KFqtvkQkO2VoKH
         W7LripfSEyJci7X+kVnDCFUh7MJQnPfzHT5NHzPHSZDk2XIqqyH/K2QwWUPP9P3DKHJh
         qLdeOmFjQUIW5svUmx+n/FPadveBh6HVdkIkHiZUdykk480ZkLQ8ES2S9gP27eTWkfOl
         zxqDvp2pBCOs/9o8AuCY9bi4TJlo5cFMzxOE7vQYogiXBQ8qc+O+E1GSfHVgXADjkmNB
         nxrTa7b2ybKbymsCbi5s5DK5BXFoc/n2epUPqB8JJvG08+1lEU+omPnUCcb7gdjGUW4B
         7qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795575; x=1795400375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=y2hYonq2l6JbSsVkWM6loK4eR3X4bytri7yvI4MCX5BedcHddTcjzoftPuapJt+1E4
         ZsiOydPpmS1yPNLfuMQgQJ2oA1HsUOhGiAUvM5jwR8pZOLG3BTxGaFbBjAd1gxU7j5Gw
         B7MBJXSJKbS0kbdhn2NvY/vLpubejZJo6O4b7VpO5oZQ8suvfwEvQtZEsEYu6/3x6U4B
         VKLyO51ya5Sop8E9nIDQ7kp+DIKb5n8T/IuAiGz25EjnuVqnHaQqdu0klCANHpe9B87D
         Pe5gZsp0rT+LJxqXTvMhGPhivtzIzrxmjKttdURtC02XbFKadz7wYxqarQAr7lrAkoJ4
         qVtA==
X-Forwarded-Encrypted: i=1; AL+hErEXg/Lpv2uiSWayC94FsW55mmes3um95MdtsCnLFstH3CnYTUYKsgrrdKQaUtP8N0oo/ykzf7N/Jl4xnw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8vJ2YKk0vpA3liBgKtIgZoObxL+WOkHBMfx7DXQbKHopXEE/z4
	37f4fWpKW0u/GWzggLJrEvtWz4hgQ9dOPJkbr17P/+vTysKrFVSOvGRow9W48XD3HtD0uu4dWIv
	ueQIvNFmTGTPpFU/88RhDZoVsqr9Zo0I=
X-Gm-Gg: AYBFou1l1QryAzQPLci/6svSpNyGZyJy9nSYnf63rRaG7Pjqfc5gYl4kbrpspLuT8Py
	8MSnRC8ghHqHDaq8/rVuBQdhzcgfo25PmJPhqflOXV1dm1se9P93pKThp/KbXOxNic2Ich9/4uE
	hYc3L4KapssKnJAF2jUZv8Y+KTcUv2I5yRPGWWIUpgmQ2hZSSg/xTwwTMlkn9f0s9pxSnN6zHTR
	lV36i3Ib/jOSS2hWfEyFIgczxcgEkl5Ul/wQwMJ7F01DWmQx5aQxivUq0vbW8EjC/tRT7Z/RE92
	LqSArRqzTzQb4JNvcqC4ZcXkSsXU4vnXwVGIPv0Urw0qdU9gg1mhaXGTHcAFI1x8Y4u1eocrKBp
	kM3PkC3Sco93PW3PHQFsN8cWmICTlgGWv1OZAXEEFSIs6XXLRxxanh1XF2vlzsk0NpLA9AgPVXf
	r1shR6eE5LNOOJm44wdxdm8wp7W+xIyys7rKl+IEVlmoi8PYzFkdkJg6dj88Y7IR+0cpIfZEasv
	3v0SoJVRRAGKj7e6XHvd7eIBeAnEw==
X-Received: by 2002:a05:6102:2c8d:b0:7cc:828b:421b with SMTP id
 ada2fe7eead31-7d64d6ca4dbmr3337958137.6.1794795575374; Sun, 15 Nov 2026
 18:19:35 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org>
In-Reply-To: <179479100276.3291.7162632058743254408@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:19:24 -0700
X-Gm-Features: Aa3M54oUIJGqhOxY6fZncLdECG4spZRJMb8V-mVzn2dq9iEZ8uyZ_G6ksg29zgg
Message-ID: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while investigating RX checksum offload behavior on
H616 and reviewing the shared setup and feature-filtering paths.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

The capability loss was reproduced in a source-extracted test using the
actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
relevant setup and feature-filtering logic.

With the original code, disabling offload and following the reopen path
clears plat->rx_coe. The feature filter then prevents offload from being
enabled again. With the patch, the saved capability survives that
sequence. A requested enable that fails hardware readback still clears
the capability.

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Tested on an Allwinner H616 board with an AC200 PHY.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
