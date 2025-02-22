Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66451F0E5F
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740221169; cv=none; b=eziECqazMa467d5FWtG1LgKxE53S3hkqR5L5IWqD0WpDYZluFMAo/p45iv94Nod6udnAAaMq15PhZcsfkViRuUxz5LDpwd+ob4iZopEphQUzYuhEEAOlrTCDR6zF3QARU0Ih9kTTJJtMhG0WnID3/HmLwL6Zgneep0hies2jafc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740221169; c=relaxed/simple;
	bh=3w6AYLRAJDHJkRy108s/uPBLDjUnLunLph49q7bXdfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZxRe7K4gRbfaUtvbdJh9kg7eqk3E7OcL3NZl3rfy3LRMPdqWfPy2BSMxvSoHYqZWz6Z3vnqTFskJsUhSXvU/igcCCBh2claToYcgEKQUeyyDnxFPfvGK2uVrJg1ISZp3vhHp4xELhxFHgB+HLnrSClG5ldXFGsB4484lHQWF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCsNYwC9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCsNYwC9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso17572395e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 02:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740221166; x=1740825966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3w6AYLRAJDHJkRy108s/uPBLDjUnLunLph49q7bXdfo=;
        b=TCsNYwC9c2LV/HsXv2R+A9OFpoyLFx/dJzF2y0KnHrdGXEO/4t5ep2WPeoMY1gqSAN
         oGHH3Xkg1/gr0Pkc/Ms7VipUsl72g2FIdsvxeGZOe0UaGzeuwKrCbFHxw1UE8D53HQvZ
         yN/6BJVn4Ox5gG4fn0jY7r7UtN4fzk8N5IT5CM0iLbpY4ykdEwZPTuWtfTK3LdxDaIeX
         SqX9E4sdX62gugDvlEyMAIJbUH4PZSi8CfQXtsqIxH7LbbYuJLX9B5jUv7T+WAzG4jQq
         HmZIUdVDPpEegISSUJSwdxuuY7fhO2AGnPyYZg2k2FepUXRK4lfPxKexYb8ZOyNsAf1v
         cKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740221166; x=1740825966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3w6AYLRAJDHJkRy108s/uPBLDjUnLunLph49q7bXdfo=;
        b=ibZJbSuQB60I1RdpLweEMnaJ1PY2npC2BNOiSrUD0J7O7PtEmbzkYm69J4uXDSSErx
         Mj/6Pg7g8VEKL8oPMiOGMvIpzu8AKI1KzZBan8M2o/m6ZCA1hCs/tTFVAZJt2+APX5FT
         ro2sEvV+c+ddTjWx4N5G42nDZLZ5mgiCIX7JOHITZ6nU7FHeaYRYpXWnIDmU7qhWkg+3
         9ioHPShz92LfrYPXjXgoIBANPrsb+2DBjdWRTz2BmWqtBRH/BpZa+H0LjQ/wxqz3zOep
         c4i9ODb+tGqLkA5bvctAXZnsnspo0Q8jIpueqBOlWKbLtcVojYA9vF2BeoLQIhiYSsp1
         votA==
X-Gm-Message-State: AOJu0YyCRi1JHfk4x0uf5b6XX4OTVGLf9qKMFOo49KkayNlIf4R8J2QX
	sugL6WFAgULoLBVgz/cNkOd6NFI13gUMcFFltJ0K9r9k8CNDFThrsiHuIsZ4
X-Gm-Gg: ASbGnct95JoUW8bIugmK+j74mFrt5G6P3qw7LYfO0M4JfncU/NiamGDbVNHiOixHUQ+
	sL4G/bL7wvtgMN8ZkSGU0W/xAaYiPmhXoZcSOSPXmHVsYgGOuO6W8JOx158VAP/MSsXWixZQPtn
	PjQCMdACWHYOkbt5bLk+VEIATcW+YlFIBLNNwmacNSONZ1l3vh5d4Q2aolDChPYxj1M6ALnj/J0
	lLUgVxOe8C/69eBTKccxno+1qVEruNixixgww2zr0C8o+Fbf+15jZtvNRveGuxbE2EL+3YhZCL1
	CMBJNcKGfOGNY1xAu/4LUP/8q1owMq+WHNbWHqm3RsM63ln2Wmy0l6s+ykSyzyvCEYZKIDonRm8
	xKQ==
X-Google-Smtp-Source: AGHT+IFPEhyALCE/PyGlhC/F28EWgnFqx4EM0WCKxLB2JiXjfn2Dgj5KCVbcYlDNA9QMmDfmCK8jYA==
X-Received: by 2002:a05:600c:468f:b0:439:9377:fa21 with SMTP id 5b1f17b1804b1-439ae214295mr53463335e9.19.1740221165830;
        Sat, 22 Feb 2025 02:46:05 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65bcsm26074249f8f.65.2025.02.22.02.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 02:46:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, samuel@sholland.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject:
 Re: [PATCH 2/4] arm64: dts: allwinner: h700: Set cpusldo to always-on for
 RG35XX
Date: Sat, 22 Feb 2025 11:46:03 +0100
Message-ID: <2224078.Icojqenx9y@jernej-laptop>
In-Reply-To: <20241018160617.157083-3-macroalpha82@gmail.com>
References:
 <20241018160617.157083-1-macroalpha82@gmail.com>
 <20241018160617.157083-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 18. oktober 2024 ob 18:06:15 Srednjeevropski standardni =C4=8Das=
 je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Set the cpusldo regulator for the AXP717 to "regulator-always-on". Its
> current functionality is still unknown as there are no schematics
> available, however it was observed that upon reboot if this regulator
> was disabled GPIO detection logic in the bootloader was inconsistent.
> Keep the regulator powered on for now until it can be defined
> correctly.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


