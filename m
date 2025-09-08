Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE62730C621
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Sep 2025 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757340706; cv=none; b=Xpsje83su9Hwql2RzQ6sztcoGcDgk9WmmOlVaPoW6semh9T+u6W/1gAqRoa0+fppsXh+I9Yqqa039oZsh731OB7reHyTBJPnqdKHEaRqvAIP+/9O5j3CRTBZ4xTOldKrARvliWoQA2RNFYLlgB0LH7sHQg0fothzjyiCO1k3o5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757340706; c=relaxed/simple;
	bh=DRJs7cuS/Uz2IznpN5HdtER2WQNJ7nR26zFyNfponKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hx/B9lr4e2mWgVY2CEpmSIRjBKbKL9zon6bg4ik7vmk1380ZmBYWyfuUsDm5Clck6jF+IBN46H/6NcPLhez+OXBMtxzQVJQhTPPBtlLLuFsG9tYa6AaKi/pACsQ2CfGdfST08XpuhCjy+iq4V6aNzGsPTXMQWYWmNc/5sQ0dxjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km6VMuj2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km6VMuj2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3dad6252eacso1959608f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 08 Sep 2025 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757340703; x=1757945503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8OjmRy1zdV1TcewZUm4b5+QVniQB8Uid6EOl4nKsOM=;
        b=Km6VMuj2mlc/MGbXifca50QOW9FMt7SrmvLEDPL0lQ7tjOE91U84lirEFZjAizvASv
         wOLpJmiZmotV84l+Silp4zHhj0OBOdtyEq3hWMoTjSQCSuNHjC0kdWBxN2RUfEnqjphi
         GUdvk149bU9gdW0eMRiFDR2lrPY75nBcTI4TQf4EBEQE3vxyseOEDLViBA3wL6fcfdMJ
         hblPGuVPb3xDb89AKQxpPiQuoIiMUi3SMaBNYIkKN65w1RqhjneCmvEYERVu1BUNB6hr
         2VtA4J7gz/RKTXwz9miwFF/TTEomGL6C8TQjCDPs+Jfko1qRiTzaePCWplR3vxefAxLK
         56jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340703; x=1757945503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8OjmRy1zdV1TcewZUm4b5+QVniQB8Uid6EOl4nKsOM=;
        b=YK7Tx0HWYLO50bo0NSr3STfLfglolVvrtFvhTFkQURtURS63th2R17m/sTwHqv8s0o
         DfB87nqMPXDm1hHCtWs2uo6ZTXLfMljrE0lYMeg/uFQ5XDnb8aeZUUHxFxABPRaFG2K7
         PuvPT2c1ykzI6ed5jUlJSvl2alRQae8dLE/XZS6JpCmwi+aC1ZAoYgoFosUyHrrEhMru
         IpNnYgbH8grBX+2Bpqp+ghROUKsYMRpuoHBVj4B2G2GpbpQQ89qGaBv8w6IT4cDhIk7x
         xLpYIHSAkVwOLwQGgkYUnLEZBr4Nwn/jwmlQH8rHIjJ8TfmAMwOO1m5j2cSyF2+hWO9B
         oqrg==
X-Forwarded-Encrypted: i=1; AJvYcCXhfYlR+2mCa3uLXWCtGZZc9/y/iXNMes4zeQsJ6ZvkG8f8lllFtO4MBYqVnGcH2EJ8oBmBTGTwaQ85Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp5E8/yWEoN95nz69PAZkyuiXyoIMIP4qzkbJYgs173eEgKzjp
	/6nJH7gagXALCcv0EEHujzjmjpdy4n25PjRFkJ73d2pE+YOvD32izm9bNMaSFBUrkAM=
X-Gm-Gg: ASbGncsxGEmnVJf/Iy6WaRZ2rK7W6cRhWMB0KEh3pjgSJU2zC0xy3WZL34F7muyjEnA
	svDdSU5igAmrz2OTe6qezO5+vem/WGDstKUG9OL16VkUSpetfa5NMnCXcNlqjz92vOeRY99El6m
	BHEAPud1NpfuVcfhziHBFPhp1zp6sY2PdtC/9fq05nEToLl3mzVKtPF4wqj92I4GdF3Kk0a02RE
	o6+1QF//3T3592PB6zASC5Yzvic9TueRAGMpxZ0z7diGatzgfePJzO15Py4ufUcTf5KIJ035iWx
	kJygx/Nw41C8fKQ8MMdN5fcggqrFBpTOloLp9ObrynxwhbJxKV/fuMBHuag23OrjRncaQzRMm5a
	+TPMcH2Ing6Jvmwc5YmrZN6d4XHqMOjSF27fpm7S52zmVBWq6GCfQB1YWoi9o2fZ8ODjLwNXXjL
	k=
X-Google-Smtp-Source: AGHT+IGWLz19Vl0+/eQms2Pj3llONuuT8W5neNk/5fI3E0hR9P0m01Pnim45kDUcIUT2hLRLIFiUUQ==
X-Received: by 2002:a05:6000:2c0d:b0:3e7:441e:c9e1 with SMTP id ffacd0b85a97d-3e7441ecde8mr3711285f8f.18.1757340702896;
        Mon, 08 Sep 2025 07:11:42 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm41513743f8f.61.2025.09.08.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:11:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rudi Horn <dyn-git@rudi-horn.de>
Cc: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] Fix detection of odd memory configurations on sunxi
Date: Mon, 08 Sep 2025 16:11:41 +0200
Message-ID: <2234613.irdbgypaU6@jernej-laptop>
In-Reply-To: <9c947490-a571-4b35-b3a9-66c8174a7490@rudi-horn.de>
References:
 <56f44755-fca8-4364-905e-685e79fd1aea@rudi-horn.de>
 <1927944.tdWV9SEqCh@jernej-laptop>
 <9c947490-a571-4b35-b3a9-66c8174a7490@rudi-horn.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 16. avgust 2025 ob 14:18:44 Srednjeevropski poletni =C4=8Das je=
 Rudi Horn napisal(a):
> Hi Jernej,
>=20
> thanks for the comments on the patch.
>=20
>  > I don't see a benefit for public function here, since it's unlikely=20
> to be > used anywhere else. Just mark it static. Compiler can optimize=20
> it better.
>=20
> My motivation for this was that the implementation relies on subtracting
> `sizeof(u32)` from the address. This is an implementation detail that rel=
ies
> on the internals of `mctl_mem_matches_base`, and so I wanted to place
> it in the same file as `mctl_mem_matches_base`, preventing it from being
> static. It will only be called twice, so I don't think optimization is=20
> too much
> of an issue. However I don't feel strongly on this if you would still pre=
fer
> it in the same file.
>=20
> Once this is resolved, I will submit another patch with all of the other
> comments addressed.

Ah, right. You can leave as it is.

Best regards,
Jernej

>=20
> Thanks,
> Rudi
>=20
>=20




