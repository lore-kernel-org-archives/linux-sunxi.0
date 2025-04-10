Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB620126A
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267386; cv=none; b=hiFkLxdh8O3ub6LWKQmvKx7y30rw620wMnx11Twbxh3aVNsImA6i2+wJOeVHE6Cb9EKZhARQ3Y1zhjcrSd8/k7u2SmwbwlHL3a3/NZlA3i6ybvf/Aq5CoaMonGYcPsPiHveAU7Fkql9JMBPPC9f9xbBnc234qeV5qQ0xi+OIlY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267386; c=relaxed/simple;
	bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UApVZd5ymGCDH3/APJ7Gy41gWmAYJKlEHLVrT01mOTw74qtou3FsvuGcojlYj/MrRc5mXSor4rGpIrwJjR0PgE0+BHzMrBWFP2e1iJcOzAiuVRm/Cu3kSPlwCgCzzI9w0Fzjxr9kBv9FubRel8Qt1dlTm/yx9z+rr9Yh8gs67XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkYKevqz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkYKevqz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so3730105e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Apr 2025 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267383; x=1744872183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
        b=lkYKevqzjVvB+C3uRLnYBNDQ3xmHi3pnCUvqrzdh4RO/ullK5zrHXmUUpJDnM5uVEZ
         qRQjaxshUhWbDpQoKyU5vk2/oS0zWJ7BZmulpQwmTKmkDwVQTsgsB4w+sHfAuo4d/AkZ
         LvpO8L6lkFQtng288UlGub3tJDgSrfjO4CYtsuvQHKP9qaFh3GhhQMNWx169/m7RtCh1
         HavRnIvkyB8ZVG+avGvgwot4zjgQLbKRwIP3Krp+8Slm1G0xz+8v1TZqjNfx12EFN9u1
         6jEVXUz6o0DbHBke6fZyaafJLCgwJ6/5q5XGKqMnJ8KR3tIOHeFcCNsmHEg1/vEuqiUI
         duTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267383; x=1744872183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
        b=vddt8LIBblnztOYPPh2IZ8BdilmOhrExz4V9jBbVqxcvw1rvwoSOwMzZGJ3AOMCY9Z
         k0aYoS/f1CddLM96re3lGl+5YaE/+MgtHYEJQTAlAgjBc8QUbr+cmIVN22uzgczVBcIj
         AW1E9uN6B4ttyJ70geUKxN/HHNYjniqzs/veJNkwVtMLRfV2ovV81IcZI8sILoQgiCC8
         6YQopqJ7DUMl8bZUMinMcBx83mAaUzlac2zVDNX80ayg2+U3kPXDl1WtwMNbSZaMqeFi
         PbuN6KJYguUYfwnkxTUNFO07A6uF15TDG6ABJjUXt8MyzF4HoxI4N9hPU0J6uej7DYIh
         yv4g==
X-Forwarded-Encrypted: i=1; AJvYcCVGIoqDymvMqzvqBZdiVOJhHeRddYhEjkIisueLnvDi/vynzrev2P/XhV8KMc9yXQ2clr8XOsorMu+A/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz/Zm+HAlHBrPZBN4Ayup/3XjSmmQKahelEmZq/hfoSVrhRl2h
	IJubxZ2UOyBGBC1jSZVRIKkP3j9Q1D2Zcv4LDnpF9GgcpgEBRELl
X-Gm-Gg: ASbGncsXVi2M3Omlg4DbhLyXQ0wrp7+HQRqyhs7A5TLP7tklo12Jd7az5oSjMlWN0qq
	EJZkvraND6TW67u18RvdIARNoyKtFL1G1X7kkvyVpXweMKIbxtNExtwVOM7oaVZcQ4zkTnYXEkN
	c4G2i2qF6TUwtUqhL5qeN8lgVSLDo5JgR9NpUGGkSGhx8McSVRsndNddpMacybW6lhx1EBkRgvQ
	8J9nt+WEM7s+tHjHRCDYRF5QFaVaUDhhtBEpe9VGQ645hA22QA5xxBFO7t/nboUVYRL7sCTKjYz
	zdrOnk3z1fk/8moJDHnhGymgtBo911hyAzGBNJHglqwMGeO6GGrzY6+1UYKMjW4u9UhPzwxMWu7
	gB1Wefl3TQyUvPhoY
X-Google-Smtp-Source: AGHT+IGD3pEoyOISIn1Zfw6v9W1npm1S6qIsP7cYoTCH8BploIFWDI5dRtvNA2LJBx5ej5GOm8Sf4A==
X-Received: by 2002:a05:600c:1e1e:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-43f2d9a3c76mr13488945e9.32.1744267382701;
        Wed, 09 Apr 2025 23:43:02 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c8fb4sm43670385e9.35.2025.04.09.23.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:43:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm/arm64: dts: allwinner: Use preferred node names for cooling
 maps
Date: Thu, 10 Apr 2025 08:43:00 +0200
Message-ID: <5874556.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250409203613.1506047-1-robh@kernel.org>
References: <20250409203613.1506047-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 22:36:12 Srednjeevropski poletni =C4=8Das je Ro=
b Herring (Arm) napisal(a):
> The preferred node name for cooling map nodes is a 'map' prefix. Use
> 'map0' like most other platforms.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


