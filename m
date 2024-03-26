Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DCE13DB9C
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491814; cv=none; b=auM8vQoE7MIQizLqPzONDHify4Cvj9EI2J/HWpdxH4INDQqTs++ILZ9N5ue+48stY45gy835ZbL3mkwDW+IYF/I6BRBaihcn7798XoL+kHsDD4p3VbuGZwjo/wc1dD3a+iphbSCJMMsnHWcIIRAiXUfAuXLfqR8XdC5unljagDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491814; c=relaxed/simple;
	bh=HAbJIrqhgJLKNyQIvmSBkKdvLwG/PoMLULYfRmAzYZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cPCS6D0y7j2DqT7IBJcURbrIxauSCkH3W4U2Lkh5/CwkEVfv58xn6fYv8rlDa6xs1mI5cLSkQRDFh83kpJy8BeGZ8xZ+SjR7sjmHdZAVKtaRNIAVG8e/7ziLip8ydQBvvtP0Mct3Z+lbZ826dZP22My0K+tLaxhQYxuE8p4I76Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFsSmeIH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFsSmeIH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a46f0da1b4fso775727666b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 15:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711491812; x=1712096612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAbJIrqhgJLKNyQIvmSBkKdvLwG/PoMLULYfRmAzYZs=;
        b=nFsSmeIHoCK1xemtNbpWiiFaG56J+IVes9LFd9BF3O2fi0RPmhicIWNMp+azxd5TcL
         T8y5EfwIjhSsPxD6Z3694+GwYuRohTYsLo1qWy/KHRYpPsiZjqkfJxkMW08NijNBJw9f
         KSIk9WBpExOYMIh9jzGdqzgXUxhsQW9NTdc3k4R+nDaoIsb0sWfdyERIqlt+OEg0PFW7
         xMbUNdlR8/2L3D3ov0onUiFW/q7qDc0m7AWrAG4U6etI3T+l2RwGJ6gGg4PN4O1vwjm5
         DRBO+k6gJpVdeJ5pflLzfaWOeYDSOOT1xU9rnwc6B/3ubfASfXejF8XhGmASnlUIyfOG
         +6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491812; x=1712096612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAbJIrqhgJLKNyQIvmSBkKdvLwG/PoMLULYfRmAzYZs=;
        b=Gz0iSefqC3w4ee3CDs5J4d4cOb2zLxLqcI0MWWFbUjBZXdzvJLuTAE/Ejd9N7DhtAK
         GL9wcsCMWbemrb8aCoWow8MH+ixvtWhjXKWUPYKOvLemjQ3hRqiiyJFrX4vRVPfd49Bo
         60Pj/f/eM9DeEKBafYS7tJOumTUUjqSe0FCLHvlwP5sU8CqD2xrQB4Rb9EAKnZbwu2Dh
         zU0a4LZQtPFxz9fpgfYF74/LQlFkSOycXRa5ugGYM4WGKmztaMmercetWpi7mz9CgZnI
         de+cdbyYqqMQTs3YlpA+S8IODZer8cKL/CHe6JgbhNsMOpXpZCmtRjPRvFk71Rp45pj4
         PyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAeFpHsJciHnW3GU0SHcdBSTDnSPBVnovcW13qZGq2w5XLYib9YeELRkjKhc7n5xO38Q+2/EJtNbya0frZ4fIkdojvyTGJ+b0qJ/Y=
X-Gm-Message-State: AOJu0YzKnuWeLAZw8hWfpr6jhMOR2nfT9kPsstUDTMhGx4dJ3xcHc8mQ
	4sQD2XX98MaKM9PyEeuaxEOvrcNlGdJ5bdy7aEIKIgOgVf7yB82P
X-Google-Smtp-Source: AGHT+IGyK5UIAndUPbmYd5slTEu9rs5EVA30Lm435nsjvXpFD3IEpeKf4gdpJPemaN0WJLlb38xHlA==
X-Received: by 2002:a17:906:1784:b0:a47:5171:8d61 with SMTP id t4-20020a170906178400b00a4751718d61mr642738eje.60.1711491811672;
        Tue, 26 Mar 2024 15:23:31 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id e17-20020a1709062d5100b00a4734125fd2sm4632617eji.31.2024.03.26.15.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:23:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Pavel =?ISO-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Pavel =?ISO-8859-1?Q?L=F6bl?= <pavel@loebl.cz>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 1/3] ARM: dts: sunxi: remove duplicated entries in makefile
Date: Tue, 26 Mar 2024 23:23:30 +0100
Message-ID: <1879937.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20240320061027.4078852-1-pavel@loebl.cz>
References:
 <20240320001152.4077150-1-pavel@loebl.cz>
 <20240320061027.4078852-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 20. marec 2024 ob 07:10:19 CET je Pavel L=C3=B6bl napisal(a):
> During introduction of DTS vendor subdirectories in 724ba6751532, sun8i
> section of the makefile got duplicated. Clean that up.
>=20
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories=
")
>

If new revision is needed, remove this empty line, otherwise I can when
applying.
=20
> Signed-off-by: Pavel L=C3=B6bl <pavel@loebl.cz>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


