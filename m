Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149FD3DC87A
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607473; cv=none; b=gaiP9CXjsVxoyfe3nAWM+7akA8CK5909ysGTAmukKSZM9rWc2yqx8/W0b8OA5qkPcR8a2xwEe+3KRAky+4qZ49JwRO+m3CW5agR2L8dGzwFJ2AsBSPWkwr0D9rFhHVWDGBsq9YImy/uDmFHOvjLFiDMjI0GWQykmLxMPxDMPEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607473; c=relaxed/simple;
	bh=fv65w+KgckmCghJdMUx+fVMX+iVqK3WuiCAJupqCACA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7oWVWXA5SnjiVLuUTHzFLCQKjDSQ02Tc+BYcXYPzYH8IzZG48yp0PbyvenQMYvW5qmWk9oEjxfyHylCO4gH2S8Fm6pml9nofuEYPf1/w1eWRD6NIQCjQkiH0UaYm97H+l13oKLwXlnsFHQVAY+fQFa4X1qcXYmzxNMb7aaJv6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7lsKsZe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7lsKsZe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-459bf19e87bso1394009f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778607470; x=1779212270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv65w+KgckmCghJdMUx+fVMX+iVqK3WuiCAJupqCACA=;
        b=I7lsKsZe6ejC0T4x3SjqA7QfuNoQTsWXMmXPKT+snqb3rKB0uAKfMKg+0evD2VkB3Q
         nokdGwOmjCGi4sP61MPLxbBw6gBN+NZZWiCo5RmRDQmUj7LoD8JPrBKYyjnQ7c6BUmNn
         0mRI4kWgmXdeM5ebAuLRHsA65h6EvIku+oSz3lzgu8hf2edzb1KmNHvH0CsKTpdEychW
         XM8x+bQ8EATZdOvlM1Vt6+tesNHyGTANDEhP1m0OiuLBTIdXy9YNshneAUT8K45/1uzw
         IRaDPUmoWuT0xNZ05et8dH36pqwHFJoQpNEvmWGeae7456A9igFfK696tXHhdjo3ChXu
         nASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607470; x=1779212270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fv65w+KgckmCghJdMUx+fVMX+iVqK3WuiCAJupqCACA=;
        b=e0uCOnx82PIZbf94lf/WmF4+7incxXX3wYgHgaXxxrmYZ1urI9QYw74cqL6TLm2pAh
         MZ7NnQKgs6m6dheVgZzAnyaThiwtBpIb6P4qZbscSjd+kRL/slvKSc6DRo56K+7bYESo
         MHWXKuwfP7BqAbDCr5l5lXcIi5fzNMmGzCDAuUWwt3nRdPRWCX2NvQPffsgjxMQkfqW5
         1w8aqMfQoHu/dP1y8ZA6X974ssoucxDyOuEAFD+7vG+nRybBeIRJYTt2IfIHuHKUPMoX
         AdAlsydL4WAjEbkn08cgBxmROBkLSy846SD78SlF4Ge4MGv/NSVL1XasptW6LTCwtFgl
         nqDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MaR1ZXpS/0r+x2ySWqWZdVJ0jfiJGTMGcds3N8hJcnoTPJGNvSJwtS1v4Rbelg3a5jeJ87AgLnhBUXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmg5VktuRphLotVFfNqcVIr48djvnaKhWZlcBYZ8nBDrUMVCnU
	qMAZPe7ZFTIMp4/h9kdc4yyAPB0BHeXplkeiM/XSORJTwZsvOcRMaphmATKdnw==
X-Gm-Gg: Acq92OFvkLyT/92ioZVQxWvSeFl1GvmsH3NqN4C/rG8w+P4krKOmjoDWzzmXt/Oc8hu
	VsIV2Q44/1yhqp6pIpWr/nee9Ov2roT8YK6rShZ7jY46ieR7wrGu+t6+ohYsUOt0HPUWat2uMwg
	wKiX68s/NliGnF7EaqTrap6gMs21oBkj6YvUzxERfqUbB1bbnw0f106GwbyIg9VVgNcY8KE26lj
	1p0HbnwrjqfhwjFWkF4b9d0BU8WtSqnY0PesDkDFgMYHKJ9rUDbe5TUNAFaC7+0uA3hWCbgZ5kL
	f4SlmJe4fCGDRHCsS2M0tC1f1ls4UTHi1mX2iDjFc38Xnv3KcE3BXuncNyS7YA0Zozu33i52KE8
	phVhG8n0le5uvo9eyco+BQfA8sOqJARVvB2IMDM7ZsDpEiPfIxxZknZFk0BuWQ7uPdT/0zuPPAV
	CmQCkK6KdSTZwMfNaBrUd6BquP0F3LI8Ro5Ws907AYEwfwP80l5BTMlId29Y2RtmEmVKR3Qg0Pn
	99wwdO0RNIVDyZo5A==
X-Received: by 2002:a05:6000:2311:b0:43d:6244:f8b with SMTP id ffacd0b85a97d-4546140ac8bmr30344745f8f.13.1778607470435;
        Tue, 12 May 2026 10:37:50 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm29913178f8f.4.2026.05.12.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:37:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Chen-Yu Tsai <wens@kernel.org>,
 Paul Kocialkowski <contact@paulk.fr>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/5] spi: sunxi: add support for A523 SPI controller
Date: Tue, 12 May 2026 19:37:49 +0200
Message-ID: <pLYemXh3Sp2-EQWOYmhnyw@gmail.com>
In-Reply-To: <20260511213713.15943-2-andre.przywara@arm.com>
References:
 <20260511213713.15943-1-andre.przywara@arm.com>
 <20260511213713.15943-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. maj 2026 ob 23:37:09 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> The SPI controllers in the Allwinner A523/A527/T527 SoCs is very close
> to the one used in the R329 and D1 generation, definitely as far as our
> driver is concerned.
>=20
> Add the new compatible string, but use the existing config section from
> the previous SoC generation.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


