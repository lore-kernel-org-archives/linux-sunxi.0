Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9991F242938
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741798600; cv=none; b=GMo3Ty3YU9vIFCOuLz/HpJOEBuV3pwIHU156yYJF9Kdxj6NF0hapPGtGeTfnmoFm5iZjjHsHF6Nks/zxUReaRjhsgCDhwYy0s5sdI9/eplHxS9TQoDsU1jjpiOfTPQCaA/WkmRgfEREAt4x8KIhGJqADARZqyVYq+4KT7E0LGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741798600; c=relaxed/simple;
	bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkOvD3o9OWRoairMx9gTKb8t/KJjkeawr6kcdJcOfIUurEurEzoMWAFwk8Xi/HjtQIBQrFoOK7W7eQl8241eJUktO7vw2YceI3taBYnLRbxfdKCEleLdRevMO+frfKTTCoZ/VQ5fD/ZqwvRlSAGbunoO3d3kzZCj+EbNZLpE2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTpWJbDT; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTpWJbDT"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5b572e45cso12783161a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741798597; x=1742403397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
        b=XTpWJbDTvr5UPIpb3BGdztnL/1mAYEkc4qrwcTBmHbYk9vMapRhtvtzIhy1l3BwJ89
         jQVBvC+jeI2DcLwgFqw88vSmA5x8P/iFpevuveGUI3NIafG7NcVVvS0cRRdjQ7JT4ed3
         FcDWFis5hvAqUwG4JVFWk6PxV3LEKv6qU7QGNao4pDKPklxtThIZLcZ6QIBObA0aMqSc
         g3Ga0pOwKQ6oa5YbVbm+2cFAXwo7UqSeYPROMnoIA2/wQP6Y40HmNsbiL+ks575Qkc9O
         TaAHAg1jsNAqg263gzXMFFYH6MoOw1uTk9L4Lgm69w+TLskYOSEgN9qrwLZE67nEEOJl
         DvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798597; x=1742403397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
        b=cQfotgI1+VxP1xFwI3X0ijPUnGICPPtxemmN+rN/ze5azZsZm/hMuAwR9HUuL8d4BU
         PM3Yjvhc22nBgQArb9ngoA05VXRQ7H/cwSx4jxQnWfFruqXqnPu9pFj+1jibQR9E+bi+
         2X7Xx8B9eL4HA5WaCQYi+kMtr14vHOFYMx/9z6lloNpkndP9SwoHNRi4ExMHY5I7fKqY
         RdNc2g7+zxM+XFCr9nW/7JqhVg8kGb2LhaXxVPHyyuKake8mqGqhePIIYt9ZRBYut7ym
         RMEiEEJxO9q/u+mrC8e8R36MJxgIbXHkkHotUSTISVyX+AFQGtGlLhKYWxqDs8caWzwL
         r7iw==
X-Forwarded-Encrypted: i=1; AJvYcCU+i9wq3e0XRTQbDzTs1G7HqtS+/8iIi58GcMv59qNkCzxf73hmereOzlaB7jCqKdwCEcAjLjytqsaFGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgKz0NxOMdlc4fyYWmBSE/lgTf+I/lV6hDck+/YOIb9Btx7HA+
	ehfzWF96Vgv0IHoVmy8has++5prqFwq7XoriLV3iLLl9hkXYlRky
X-Gm-Gg: ASbGncsUTGMGLGHo7FqkSMEO1m1RoGThA3lARcgxOse7GiggLmZYCIuQ/IPRTNdUJJC
	AmqEP6XDdF0fOzYDk+hTFeUghiTnd5s8Dh4eNWXlhknFO4mxy/EwbHR9Antk4I9a9vMR///i7Yq
	9MrsKCkNhNWBks02daJ335bgZ1x+SJHiaYSrpQYGn13g/CdeKoArQIFkHaqjAMWa5zL2M4sO6tC
	A51IBC2upuH+qca9AKnFJKuOZUqWzCaeNvNdyaQB2MZDyMT61Kj6nh4AdKW3kA2eibXiGnch2eX
	B2ehJlo4DoiWCkORIQR8gi+UCC2mXPNwBXn58dNS4T8Zy0tkd87IMM7u+wm8RBQlC2Ij2Pzy/N3
	LtLy4M3DBNzd4lAI0KtGK
X-Google-Smtp-Source: AGHT+IH8y8hQv6Sg8xyZcCsQDnuxux9UAtTTC9yU686JDb3h1xpkGSNrZOvF6nGyd/4nw/gseiJziA==
X-Received: by 2002:a05:6402:d0e:b0:5e7:7262:30a5 with SMTP id 4fb4d7f45d1cf-5e7726231demr9291906a12.23.1741798596469;
        Wed, 12 Mar 2025 09:56:36 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c733f8b5sm9909588a12.12.2025.03.12.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 09:56:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 4/8] pinctrl: sunxi: support moved power configuration
 registers
Date: Wed, 12 Mar 2025 17:56:34 +0100
Message-ID: <5869984.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250306235827.4895-5-andre.przywara@arm.com>
References:
 <20250306235827.4895-1-andre.przywara@arm.com>
 <20250306235827.4895-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 00:58:23 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>=20
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


