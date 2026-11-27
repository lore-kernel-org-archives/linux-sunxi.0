Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810621;
	b=U3NgwJZWB+YF+wZ5DpqIGzvp6WouO3KkbEvrB4Zk5T2+yiSj3x1TWWdJ4gj9Xs64FOyh
	 YUsu3sF3iU7cSK+wbu0iDqE7g+oo26uoUJnW6bz/68apdDkujsOF5MW8sglvQdUc71Cry
	 HvAbY5e48XTX5ff7yrVo5NK9hncbF0nYh4g8T9TSvl7IWOLZDQD44Dp7HD0cjq60/th8s
	 elBvSC+nKp6dGBqRlxMUqHg7XJRIJ9mISu4EY3FT/uoIMw3wGOcyN/VTIuLE0YqogD4Zv
	 I5mwxv2R/tQY+zF95G8lJtkNKBztD13lQLtBlCJRFockKjfFoZ3X/uSehGKBmdHow5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
	b=eKVuOUpksUPdN3HCnxD/xCWGXbTaO7Vo5yFkkDAhRC9qEofjSFNoggXVTEk5mT3IzUlH
	 kgHiqmr4irIW24fyKf2dSYskiS3KiY03FzGSn/zdfps9dL5XMrhGjiYN1zEVZ7IGYq5J7
	 mNSZ8SrC9FT0eUTKJ8UbYhc0APgzbU/lz6UQPnSWt2Wf1QfyPIq/ZoMzo24kd5SoEFpQD
	 UahWouHJnQvSM4wibsPBLcZAb4QXWjUVbQZPlQnj7I0ztumQPP5yoFROSKAQEAcrejl1y
	 w5k/zLhDYxeQkxG7/haS4XpwaHvy3i5K8prkgrAbaYiokuMYjsDbC1WvPJOhM4PsBOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqPBi8jq;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0E4606A32E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 20:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C0E4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqPBi8jq
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so59600995e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810619; x=1796415419; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
        b=AqPBi8jqckktklsSLzlz+N4Pnn5DIDQaiuCIxuinu0VXPhMRw97+STLBcjCE0rU4hR
         4DdocqXzNcnqqSVLKumiWRQFJxgJ/uygX+Mqc/oKeVYQeIDcjbTa5LuAUo7ou/OAmpDl
         bnRb06jGThmIhQMsvpItVIxlZTg/lw5UAEbH9aCB7LpawtUkCrdhw5osPm+afYHqt6a9
         MEHWNSdqT8Ki/Z4KWTbK1qhJgmJuqX7WMtjrfYiFvVclGFsriHoz5kVkH/gHiAIgUeDY
         NPW8DIsfwFtR8c949rbfFBwuhzf3Bq3oJHdN9GLiFVh69kM9QQoACv9jg/Fr9fwNBf+Q
         Gj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810619; x=1796415419;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
        b=jR447GH7jDnwH6JpKfr3s0jLrxR9gja4Zxs6/Osw70T3ZjGkc/t0f35pqeqP32y1is
         kASQLX3Rp3wYtHP+GJyGNVxV2VrE7u8vFmzx/qjGsu2bze+/KKYH1XGGgcuFoF++F4e8
         jpW/VZQpmeeNnFYN155lAjOp+iEN+YI60RiWpgd6zD/bZGGpTAtI+AInxMXAPXHX5nJn
         0iiRn8X/W+4ioMtAz+JTAWgoAOsZpdP+8w1vP+7XwaLSWQquW2ZIJlfcrkLOrnSaF67d
         bObL+Q7BD1grXd9ftFfI81NBSwO+Bgr5Aojs0BP92zyYSDtsJs7HJUWF/6HSKHBJd+/s
         kkHQ==
X-Forwarded-Encrypted: i=1; AL+hErHBAMtWx1tjKJ2RNUtZocZ5lbq3a6CZzHI3fKfo3V9OeRbIi1jbUY4x4q3hdpOIlITxuBq0Eji4RlgAJA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9jTq5djdDwux6SI1lVmlDDZQcb4uqowO5cMM3L4WaFaJb8rPIn
	o5Bv9+Inwlry3Qr6uVdHh/S4QKy/54Hal+6NZFwOdheGq/zMn+7kELFG
X-Gm-Gg: AZFdTZfzQkotJdov+Pa3HpX17kOJANqIK06CvSC1Gxy2QY0R9Ftl0KpV2Gapvuyb/cO
	j1Bkxy5kI+9rTjIJO80aa6zoJ/4BDjY0IR/ouqOJ0w7Q+cOBff0SDp0NXnPbe7XFiozsTDHBYfL
	9jB/KHUQx9UD2AEY2ioZcCm9X5KMaidRHbTv6yjLD2idssQyTReshAo3r2zVHpeYJDmOxqdl+y3
	/NAHGNNnH1GhHDxoYc25EMb/BoQ/+/K1dBl8M7O5WRnO/q/qXROKzHvCd1VpPfvlkluWbyk+2OA
	4ehxAAXQaBBq6DrPZWGtWr3VUeFvJwM5lUgGMQ5MesKM0Au6jkY9yOXQA7qN5qg4jsKpkSAKDT9
	Pxx311zSSwPA2dDrfRYwrh36I8kZ2uo0Jaf/f8yXD6XvNdMktegNki4UYISwX1gWiHrk/RwuX6c
	WQMo8YbOeGc/RfZcIgH5vMG/nNIy9DyP55WNaiZVzbz3w+OWEgaN9hN4IVVZ7qlHQ1s3DPnoF4S
	b/dDJTAOGWG++jyYxmvDJCYli6PTzX0DR9Ffg6h2dRD832vGpaTXCAThWoN7f6iZDYWOWUFCzVy
	VMu7vhKxs+6gilqwlJ5zxtzpSEBDxC01U4MAzKRpprbWBx9rioNV9g2/UsLxrKJQfz15uGZ57v/
	0D550bTGhUaAYKHQrr1yZNp32bqGPRaTOkeWArRmBRsKat6tr1ynO2FWhJunQTMNeqnlKjW+zv9
	ioVKQ41dLLtDDx1SQFA/GB9TgEUdBsUToGPcLwVJ4h0k1aQvpZwmdXBcbntDrA0/RuDSnD9+jII
	eWXoT26VAO74cUOytlXz3RuPw==
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr564296155e9.22.1795810619117;
        Fri, 27 Nov 2026 12:16:59 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1298123635e9.4.2026.11.27.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:16:58 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Hans de Goede <hansg@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Alastair D'Silva <alastair@d-silva.org>
Subject:
 Re: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
Date: Fri, 27 Nov 2026 21:16:57 +0100
Message-ID: <QITIdKDQRWGwlU1DQqnbAg@gmail.com>
In-Reply-To: <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
References:
 <20261127080649.1982883-1-alastair@d-silva.org>
 <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com>
 <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. november 2026 ob 11:20:02 Srednjeevropski standardni =C4=8Da=
s je Alastair D'Silva napisal(a):
>=20
> On Fri, 2026-11-27 at 10:03 +0000, Andre Przywara wrote:
> > Hi,
> >=20
> > On 11/27/26 09:06, Alastair D'Silva wrote:
> > > This series adds boot-time simplefb HDMI support for Allwinner A733
> > > (sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
> >=20
> > Where does it do that and which U-Boot version does?
> > I don't think we really want simplefb in the mainline DTs any more,=20
> > unless there is a big blocker or delay for proper Linux DE support (lik=
e=20
> > there was back in the A64 days).
> > In Jernej's HDMI series he hints about A733 support being pretty=20
> > straight-forward with the reworked H616 DE code, so chances are we see=
=20
> > proper DE3.5 support in DRM rather sooner than later.
> >=20
> > Cheers,
> > Andre
> >=20
>=20
> I think the blocker was firmware for DE for this SoC - it can be ripped o=
ut
> of the Orange Pi OS blobs, but that won't be acceptable for linux-firmwar=
e.
>=20
> I'm currently reverse engineering the GPU firmware blob, it's not very la=
rge,
> and is a well understood instruction set (MIPs) so that may be a path for=
ward
> without the vendor contributing the blob to linux-firmware themselves.

What is this GPU firmware blob? If you mean for Imagination GPU, that
blob is already in linux-firmware. But then, this has nothing to do with
actual display output. Display Engine 3.5 doesn't need any firmware...

I'm with Andre here. simplefb isn't needed. For anything more fancy,
Maxime is working on DRM readout series, which should allow seamless
takeover of display devices from bootloaders, like U-Boot.

Best regards,
Jernej


