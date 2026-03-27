Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1137C0F1
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Mar 2026 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611831; cv=none; b=lyo0QWRnJ9bCufE5sSR6WD7QEKS1GST7YBiDJP0q14m8C05H0MWRjwQU953UCzJ1+CAxA3hBY/ig53+pBGmLj8FAhRRy2GbUu+Qakif5OWvC7NuXrw9KarBmZJVVDzpyBgZ7xNI1YxWwA0A5gWgKWKv5pMwS/eITsjDi4jVt+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611831; c=relaxed/simple;
	bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzsUqirmwB6wlbXFeCMqheTmRfNANE9g1zyNpMqsRh7AxGJW5JPJ1R85EexAe4nuMPwQ0dlkHMbKe1CH5UsEzEB3BQavrkByfOpqEm7wQWXFS9kwf2HWK8MIyJxC8CKEdA0ZOdHTi5C34y8/fEeF8iZQjNZS8QPPT+muc2cIdn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkvYNkP+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkvYNkP+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fb14227cso25019655e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611828; x=1775216628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
        b=YkvYNkP+qJnLAaldlKBtBWrGD+HiiCkqWq++JsRHM5A+xbXBR5hNplAaS7QmimSTqC
         WtZsGF4OOSoONnDi5bX8C081KUP2fLL/QDXr/+9bgQARTMYtDUldPc9ugL0gSZoh1jwt
         Uw7cDbNg865ZlHJ0B9YfrLWR9DuZWUtqmhoK53jjrsUS8ipDYx18WnYrIqZLoNTGP7Jc
         XSC63PGVZ0wRW75nDmMQ98yUUxTARD6tHF1R/3wRd97dxyGrlzxpD9SvN7Dg5JVQPRUm
         r21FTTj1h0wy9/3Xb9IG3A5ni804zpwtHOGE2hPhHYOoYExxjkU2sYf3Zmvwy2/nAHec
         p2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611828; x=1775216628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
        b=aNqcxxcqAP3EBB02lUa5YSuWPcbyZheY6WdQj6cWZ69r9aMekV2lNihGb58Z3/d2U3
         KRrTtqA1bLfHkaEhiPIwXDOtTq6wH0+oWIjilrqFf9xzKWuGSHgYT2AuhmHsW78ykEx4
         GYkt3sHgKtAjfZq/6N1T6ie9R182CKkzGDncj0k5M5hPKEZ3aljjLeLQIbLkRanV7tgn
         Hw5qhd0/Izl0IgVd0c+s9mSffGguiMw4X0SfAoYmpQmWXxhkaRrcRdKDR4L5bwNAdFi2
         2U5U+IPqMRy7FnhJQah4QxYv//n/TTGObd1gsoWPF5x9nCxTQtibZ3SMh5jMUcgjBcFR
         N0bw==
X-Forwarded-Encrypted: i=1; AJvYcCWol9ikJnjLS8HCqMPuHIXYVeHM1+zEyB62QBOxWkiKfXauqFXn7ic6FZgIXXqDOf4z4zsyMvM7ncrAfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/PyQz8evm7PNO5vJm1ENxGr49zD3gLFrfG4KZzuh6zZSIM41X
	bgRWPmuaNEbe2BcwKiZgkRNhEKU3x5KPNfVpACYWzr6Fgs2JBKT99EKY
X-Gm-Gg: ATEYQzy3F4Z11m4JzOswN1wt/jeEnApIIt39U0kzoPb/GZyOtKIt5LPUjyNoN89aJyo
	zzEMKMH8I2fBj4QlT7DKGjaXnxvKsTPiMUOLmXyKwaflYe1gy1pPox2FiDhG8q/mVvbMA+LdqkM
	nu+UUfivsOsq7DUA0OqQ7vGKjtSH5706X2S0MY6l9/24d/lAt8LeNHE68m0llZt3PY5CCpoTKGb
	CPEljpSYPmMIiFZM+h8brKwMHfSvzqjPFus2s2mAnSeZI92kg6PugZjv6l+T/Or0GjBYobV60qe
	GuLMZ2KaiQ3vnIFlkkBEjcnJnmqA78eWQ7GzKxZipoUhe2JkXCWw0blDrmDOH2T7/B5mibd095g
	MgPYqNwS/iC56/htA21Vwoq++rNlj5yLgz1cBsEPc1mIzY2/44PhzUI43oN7WQOyW/lVEHZRhh/
	dbkwqX6Aizgz9Vfibxlpyp5+3gPLceb5eXyHyq7gMmRgzBlnMQyPlnB3YjlgMsM+Avq/JhHjfKb
	0RV0B0Jhr61ClcYnQ==
X-Received: by 2002:a05:600c:810b:b0:487:219e:41c with SMTP id 5b1f17b1804b1-48727f36da5mr33865035e9.28.1774611828249;
        Fri, 27 Mar 2026 04:43:48 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm184799345e9.2.2026.03.27.04.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ banks
 number
Date: Fri, 27 Mar 2026 12:41:04 +0100
Message-ID: <5976712.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260327113006.3135663-3-andre.przywara@arm.com>
References:
 <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. marec 2026 ob 12:30:05 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 1=
1,
> to be able to assign the correct interrupt number for each bank.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


