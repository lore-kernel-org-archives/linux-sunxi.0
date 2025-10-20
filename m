Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630E224B15
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973422; cv=none; b=Pywn5jS+qiojdYq04g3KBybFA3IGu2yk10a7mOVL25aJ92H5PKfS+sBWfgpDPjoP8+LFe6+S+J0w3P/j/ssRwBpuQyLBxduErTr0RULc8U3kFV5HhKSSNrvzOTM0tPUIrUHDwY6KL/hrfOFlRdq6ow5U6/boLyLok8ZdMuMuqJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973422; c=relaxed/simple;
	bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7jWEppn03MPYtlnTfReVX86erUg4T5+0NStyuhOZaJ4HDQp3YadfMqO+TWWLUA5nTRePmmBVticSsTY3RRVLxPvE9zKSgrYXIlDPGrV66EAiUi7jO5jya1jZjOZ4lsIoh4RtW/lNUgvSAVzPUBimoWv4ZNTsRFN2JRzxApm5Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAA9VCpW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAA9VCpW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ece1102998so4036062f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973419; x=1761578219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=;
        b=PAA9VCpWB0eP45sitoLDCSq39tGHcYEA8ntezMvyMZ16yX/7oAtJfEmUxLtPTR2Nz+
         luyvb32ANU+/Jpj9O7Jqt8E/Vd+YhejlJnbSsxSC1OQ1uddB7NYYAj8yKlXccn2TfHSb
         qs/nOg9in0ioaZRKIOaT/6zUWKUWVZ/hOmlyXwW4z0qyT+ifZonnEZUW6pILW4cON3Hm
         cCtP6v6xHBINoSBcZPcWvZfn25TivDSVQYwOwuOIvCS5tltxcywo6RPo/IyMI4K1fH6t
         WcdsXuEJUKNZtIN9F9QP/nFCZWdRqog1zf0BoIq+rPndiefPYd0VS3kDV5Onj3wJjCfo
         Clyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973419; x=1761578219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=;
        b=frl05sTNVeGBu+BHm62dA7kSuKd64pWrS8fHH5rVnSP56I2UF1Kg9CSUHbLxgDEyeh
         kkjmm9Yk824W7YkB2IzcUi9DxROHbzTFgP87cnQqkbU+GX51pt5rdXUJ+vtmDDrhzTFh
         Vv4cXyNsv0vsgaBejaDqBJSkDfNv9qcp5ctZCxBXUgqatg2CaB6UsyQf6veRUhf3gwsr
         UX/CGK//l2g7nVSOotY3Jb0bSjxJkx+gm1BBGUXk+SHSwqDpUuso/0felNmvIVwhRmrA
         NMQondF3rTLt+clDABQDJqeon7di81X6VRg6+ldziQKmEQBWhjU0JEzhXYrER83PpzEK
         JW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQqL2Y1wiDERDOE7NLqCXnWox7uLQiVW8DYY31YAcS4lnN69Zmbb+/wzrgAz0WHAkFogGjxbQGS0WiDA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz7qyGRgUMbeHMUdti9Ai9OgqtcA6vLABmQpnsD0qXZI+0MiAZ
	39XBs+yGcZKWZJQu4uHEqex1sc9EsQOWc7/K36a7WIWp4u052f6VYdzz+udyGw==
X-Gm-Gg: ASbGncspH8X+02OFENQ3H9ybcVzO0XTvCvBh4WZEBTtjAgMCn130V9GRqRqq4R/6Q/0
	K52FkkiK78S0BF2Eju/0RKfDEq50KRWmTzxgEzWy1dY3tvWVrP4lzmf98f3F9t80PfjlLX9URFN
	UxBrOOqzsrFz/sBuINaB4wRWWCBgGab3py29ZW8jwHxmW0iO02V2XwjqhlWxoZ+9EsIE7McBxA+
	G/XCGlOJTbn+YsVvvZPSOjQ/upqjjfT15Ixu2BhbiWzczSR6m7ySVwLtVuMFatMJolbeoVMWHtX
	YDQTbufWUMR0nFNmaQ3MmPkxQ+0kzCzB/7pADYz1rZ//Jvm+Zzl5nXfJsbnrHDC/Go9kwaBY0h/
	C+PunFdOsJr9Hoj+m62wFTWEtd9RVMF1+KvuXR853NkOoFQTEyvblJT8ZJornyRqG+C+j+YEq4T
	65Gq7t/CKOsWsVlsoULPoyOxzzXVNMgJMp17diAVa4X5adSbVw8j7g7Nr/sCDPV7o4wfOsXVXEJ
	qh+/g==
X-Google-Smtp-Source: AGHT+IHuatsA0TU0EmQKM+VXdnR7vrkcGarcXxG+sRi8D6g2SyDjbiauw6mlCHoTUL7foxjJl83n3g==
X-Received: by 2002:a05:6000:400a:b0:405:ed47:b22b with SMTP id ffacd0b85a97d-42704d8352cmr9048390f8f.10.1760973419140;
        Mon, 20 Oct 2025 08:16:59 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce56csm15655444f8f.50.2025.10.20.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:16:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Date: Mon, 20 Oct 2025 17:16:57 +0200
Message-ID: <2801089.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
References: <20251020045603.2573544-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 06:56:02 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


