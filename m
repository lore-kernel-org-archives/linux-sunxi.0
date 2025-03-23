Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3241FFC7D
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732799; cv=none; b=Gw55oaztqymnIkt93aKXGDnxC4OeEg4xhrhxHPqTP7Fpj5HsEv02gjaQ1nBC53PVOijn4GTltCVshV2vY5bqS9JItBCO646IiEQaE227l+iQ6eTnL/uwn38RmfWtPkcE8VHV1pEhZjwknXES9edfxLMavqGzzS6mB0ASmYTf7W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732799; c=relaxed/simple;
	bh=3mAhlAT+/98rrfJSoUU5no+EjGnxDlALOlnurBbcXCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mn6nR5PBRx6oVCxYjbumJA24ODRMM2w8ONNuJ0zS3Bh7Tx1jpMwS6jsslv5XMj6v7p8P1wXhtaFMq0HoGzRRL/6V0dheY14y0E486MXrV10YdTzqtfn4T8E4Zq8CP8BskujGpDdOe7Tjpi3WH9BhjnBhFGRK4PGGOSyrrNm/aBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEv8Vxdt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEv8Vxdt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0782d787so24912965e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732795; x=1743337595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mAhlAT+/98rrfJSoUU5no+EjGnxDlALOlnurBbcXCo=;
        b=EEv8Vxdt5tYiBQj4xCBhBGuGABUT1FwNhm4kvKMgM/F2ahdGDRe7jEwU4XOmy5lAiU
         UI/+d2qCYiF0lcd89n9BMvIp8tP/RmtuN/ChL2zVCXzGSPbRfdG4dJ4177CL7hWxzZW9
         A9iOW2RwiR9AXfRxWd3gVlRcbYrRsW4gfu76bARgwmB72WkR4hexW85pjPeU4NLFF+4v
         2mgnGL/OL9/n06+ISnyODHaVdwMRZCkfByXghk75zZb+tsvV4+yfXCZ5zcF0dXUqW+u6
         fbyCwhhbzz1zENujc8CYIVptf0khYYU36pEbkMzODovwmd9NGFoog2VXJnBpCxYPvp7f
         bgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732795; x=1743337595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mAhlAT+/98rrfJSoUU5no+EjGnxDlALOlnurBbcXCo=;
        b=l9cDFhsLHdIyW6TkiMmqjy4PEe1725uJoCfXAweIU+BE70Tonr/K5NE0Z8/6neuKGU
         Wiqu2zz2YsB3dzVAzjxliXpn1mHTiPVIQV9pqccFtkKkCbclxsUPoqgnB0nJyH7RV3Ee
         R6Q+EjP+7w81gd7j5ozUG971h3ggJPCU7PZaFJ1F4BXQkFk2xDg9DAEEGeViyzSkA9Mu
         HF5sah8Zq21byRr4F8D8bwlquTUN0bL3N+ZVX7+KNoqFlKmBbsisu1Mg79Yrgr9kaBFI
         WS+KcEmyI/pmGzQfLnjjZ2E3LLxcNSAS/I5E2c6sw4vW4L9gjKcRjPBllgfUJbaFSGXs
         LnBA==
X-Forwarded-Encrypted: i=1; AJvYcCUHa8NwkWGgj02gmC6XlRgRgts80XNAuXj0cO39sk//zVET+bcJbKMXy8nSiZxHuNkdJzdkTyIOp1SiGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDCbbIFpsJJYi6nKWIYxmAQe5fxOJlZsv+mSIwWNdLirclZC9M
	6hzkl00mQD4jFLDdfdABMy2Ao/UOXuB8Xgm0GQncD+EK/4Bvf/izgwKb7A==
X-Gm-Gg: ASbGnct3a8MMOc+RnDz1KW1RCZXc58MzOSo+Daw2l1vA8y7iwM1wgA/PSk8nejEgNEZ
	dqQwcR0Y8aJbcd5Z3CkYDdDXmdmIYIvhbyLnTEcN/y+OMU9WRstJKya27uvOl4otizuW1jr6VNX
	bqX0Y9GmRtEzq3u5mA9ayume2Tb8A5cnbO35uTptCMe1cTUfvEYcUGX/er9cYT/SRoTNrgNuguf
	Ngh+FUHeL5fWJCuly3KB9PukqOpC6YdX4Hcp/iDGTRRE/1T52y/F+PmGGE+UEbKpgHZxEfnbK6X
	RYBA/bPkVROsVYNl/ekrcky6+5FSY4WkHEKd6kSl2ko/QbmZbb96VC5vhRisBmwcX8obqaT5KN/
	tME0UEv+b/bB49mR9Tcti
X-Google-Smtp-Source: AGHT+IH9q1gv5DOJq1ciRnDFp882+AcCwsn+mb2Rir3rjDj+8leHkDhgXFF5ihJNuv8r1/5ra57nvA==
X-Received: by 2002:a05:600c:1909:b0:43d:aed:f7de with SMTP id 5b1f17b1804b1-43d50a1d216mr59845225e9.21.1742732795153;
        Sun, 23 Mar 2025 05:26:35 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9f0107sm7790915f8f.99.2025.03.23.05.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:26:34 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 28/34] sunxi: armv8: FEL: save and restore SP_IRQ
Date: Sun, 23 Mar 2025 13:26:34 +0100
Message-ID: <8544399.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20250323113544.7933-29-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-29-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:38 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Thanks for Jernej's JTAG debugging effort, it turns out that the BROM
> expects SP_IRQ to be saved and restored, when we want to enter back into
> FEL after the SPL's AArch64 stint.
> Save and restore SP_IRQ as part of the FEL state handling. The banked
> MRS/MSR access to SP_IRQ, without actually being in IRQ mode, was
> introduced with the ARMv7 virtualisation extensions. The Arm Cortex-A8
> cores used in the A10/A13s or older F1C100s SoCs would not support that,
> but this code here is purely in the ARMv8/AArch64 code path, so it's
> safe to use unconditionally.
>=20
> Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I have sneaky suspicion that this is already the issue on H616, but I
haven't yet confirmed.

=46WIW:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


