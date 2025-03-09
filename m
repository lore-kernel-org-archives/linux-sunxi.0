Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127D17A30E
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503476; cv=none; b=rnpIqwejo5Ay/D+sG67E96USnoilKej+9NV/ccdK6MTgNRaMgRvg+deR1AFcdDsPmgq0Mm4hiW5QNJrgoWeMbeI6airQXh193NsFBR5aF/d1GVQffd7GTdNplDgrqMFoARCoTOEsaEqtt7geAPTNixt+OIeE2Yaceip5rJ0kQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503476; c=relaxed/simple;
	bh=rz99WKtoBL/5O0++DpAUVdioGN7NnvwM+hKPSLxc750=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o85yTIYhShF2P82BOBeSAu50M+fSsIRC5TM1zShW0/pts6/dXh8J7pocTcv7lgz4r2AY5UgYlHVV6Pcjq80uWHAhoQlDYZOohIFMNILkGV+eSl8dZ6cqjhZvw1KLg8HUJYV33vjTkQMnjs4Mb18WAH46psNVg2CboMHgUEjsvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8KP7anH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8KP7anH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so406121a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503469; x=1742108269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rz99WKtoBL/5O0++DpAUVdioGN7NnvwM+hKPSLxc750=;
        b=H8KP7anHC04cGy4wavzv7hkSFVEBHCeAids7xv3hX5hb8x3MF6L3ZRrXWuDY4zsozH
         3HyvTdjqvnx5XpvQ9m0qQAdppXXJ8mPiVsMvx2bRpQSuQH2/qgj3u3zD6Tm4YROIZWGa
         kafmeixCpwL5XdMBbVL0lKJQFvo1Gp9wdvDseXEruXavJvcUz3MrUX6sGMkEVN7vi86+
         2VCAtQYE2v4pnKkveawvbGh2IZYBgj0sXNsV6vfnj2c2dHQ6pp0HsUsDLHtBr9uRYWXC
         KKB7U6SNYaojQ5BLN5/1GMtK+a2+4V6rGJbpw53/QkIwFJO1J7QyEVRVwQR7QMsnapzq
         1r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503469; x=1742108269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rz99WKtoBL/5O0++DpAUVdioGN7NnvwM+hKPSLxc750=;
        b=jmuHrDSlN1M/l0vQ4vJ6saehMLDJQFgPwloxsKeWOikY3EXJE74iviE6B2SgZdkBuw
         m2gO52s/IVhexpw7Fe2b03tm0vkoctx8uf8X+/DU84EfUC6NV1ciECqmcb7sqzD3/FGV
         S0BYYArUZDoS8wGBUC/Febk5x+EtT2Qdl2GEMUgJiV+54ug+Sm2b+SeiUcHlyVunDYVn
         aK6B7C+/MfCOvy/XMym05UkoSXF2J2DP/edPQEW35zRWBKVpc9+PuzSkYwZhWfMg8dMA
         oudGwKc7mhWogIdNcgt8byAXoTmX7XC8SbBbOZHgMBXqv0m5COEUIAq/h9IkbyTMj2Rw
         PGTw==
X-Forwarded-Encrypted: i=1; AJvYcCWc+jAw2qzYCmLch/2IxxuDKfnx9bX25EFyDgnNH00AdFKZ/Ow7JoSl52R49sgL+NO0f9HaMtVp7Ww4dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9ancK7c4uPnL1nj7odbTjCyJvRK+r5wTk2QuQNyP8ieG+6Ru3
	aMxtjsU8UcWF1TqcPejpG7UaAZr+CqCJ/hJBwY3QzOWVCC/RpbzC
X-Gm-Gg: ASbGncvT1XzAVJK/AvXJazLW06zEVkYMHBhM5Lset8mDQIGPM1QqN4fyX/FJ5xtZr+i
	/uskn5EhVRkDpwtxEQyHO8f4t6nvVQDC7EgE7hoCSe6ebz6nmC1QKUX81t3wLyBv+Z+w+Ewipj6
	7YSLvX0A5FZsRneCjlQktYnO2jdomamUaX6XeZ0FZAZrQ+g0aeZaZAmxq43Kj+x+SVbS5g9YJL5
	ZLu7N738uyIKlm6fHBP8S02A/FuTEofE3KjMi2y/VzbgehmEhbBMcME/AJ80hKZjEXOsBIKKMcF
	TVXPsDoExsB11M+Yr51FvzBI49RLUZJbdtjj5KtBy+xxwNWWC7SETWwzrcZV6Xo1eg==
X-Google-Smtp-Source: AGHT+IG6jGggHPNd0SVG+UZn0rvjVy5AUuO8FA/RbV267G+XhAkHX+wbIy3z+igqgRZsFBMzaObGag==
X-Received: by 2002:a17:906:4fc7:b0:abf:6c2d:f469 with SMTP id a640c23a62f3a-ac252a883d3mr1107863966b.20.1741503469598;
        Sat, 08 Mar 2025 22:57:49 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973a0aasm543242466b.89.2025.03.08.22.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:57:49 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/14] clk: sunxi-ng: a523: add bus clock gates
Date: Sun, 09 Mar 2025 07:57:47 +0100
Message-ID: <10620511.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20250307002628.10684-13-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-13-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:26 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the various bus clock gates that control access to the devices'
> register interface.
> These clocks are each just one bit, typically the lower bits in some "BGR"
> (Bus Gate / Reset) registers, for each device group: one for all UARTs,
> one for all SPI interfaces, and so on.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


