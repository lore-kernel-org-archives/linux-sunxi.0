Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984D31A98
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707481273; cv=none; b=iuMg1n5Ya9sHWWew1x4TRCaojKIM7A1tUmqCbaurevesMjp9UJxhFc6is99hJ3b8DLeghozw8mZJrs6D2gB34Ft6N2uZXjbvw6+Ojg3XxJwO6lv+l0didajwyloTkQpeMQYetwjZY+BpFYfECG608qdXY/wrgCjGNC45SjS9284=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707481273; c=relaxed/simple;
	bh=Pga/r6bH9nx450XgDh7x1VdUI+JpCaMEBqkeUlEIIbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICAoqTPDhB/VzolFCNVpE4G8zLMBSilxPEQsCKaQs+mu0WnulYH7Mb4N52VOeGrt68mkFO410ryaDOmWdfPUp+AlwGHzx3dyLPoetrT4TtTYVU3yJdBHdfKW0p6KTa/e0xZPeotYdEi6APecSjIX6n0d3tgnq7C9uTfKVIRWd/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lq/At4zf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lq/At4zf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso1216017a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Feb 2024 04:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707481270; x=1708086070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvNxqPcB8dVHEz/XxpwlsWOre2HHNjBCeK7zMkb1kPo=;
        b=lq/At4zfQ4Tfo2ANra5uXVlXVfJW0niiy00LbS3Jh5ZRJB7+ZcwLOhR9hNncGK6dLb
         erWS/a0ZBdApvdJamTsnAQNLo+t3tr4+3NfeLkkYhm2capzy1DzztomCsWZjPnjEHzVR
         dH4L0rCEX5vmWps+6xJRtcQbFHAcZkWKTsyNTzWQqEFoDC6kissSFXteqdR4u7Tv23Cl
         usDDRC5uz8LGi+WVjOpfKJTr+wb8exiEE8z+4w3Ya90ZTCANqBdbEZmVXFg2lD0xEJd+
         b52t+/s+Cv1an1xF12jwqvFpODtiLSiJ9jhIq1G9y7S1iCPnh3aqOOE80A1jec/Krdz7
         Nh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707481270; x=1708086070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvNxqPcB8dVHEz/XxpwlsWOre2HHNjBCeK7zMkb1kPo=;
        b=DQdKCAEzSUZvA/CUc18AHPpajeaniAcdQb2my8Me/xhx7bq8Wq/uoQUhnubhHMUNY0
         W2gO/7iL8oW2azwuugRH+nIDjGNCNjgP6BDodJCQIN19aci//lyoDZCwpQ8jfjhYYrwx
         Mngq0DVy5TMNUdfcTqOOqvczE9amz4VO9mW5Pm/s0m/nuNalLIwj/aIx2bLpFgrnaIMX
         fZ7nn2EF1+cLU+e6bGNZ3FHTAWYuknthfZbykjDhNe4lL5948xa3+cDjBbeOUt9y0c41
         FsAVi/E8fdDnWwrkB7FgEgoheXJOpeR7ruIQ3+pv5N6g2FLRDeSMQa2cOmJ63FZDdy8H
         4MPw==
X-Gm-Message-State: AOJu0Yz6njgNqBq+nY/VD21/IDHbseMxKa3VDtd67f7DuCFY42w7f42T
	suz7W3JxPbvPMDjfY17cYTsL4WCVPy4S5oClwhNaePIm9RIklVz4
X-Google-Smtp-Source: AGHT+IEsqO5Z/bEf8Lu+/lGhqWCqCpcje6YtIfsNNbfkcamVTnICGjYN2h+pUyIFyZEcHe1xAtGj0w==
X-Received: by 2002:a17:907:764c:b0:a3b:c54b:5f65 with SMTP id kj12-20020a170907764c00b00a3bc54b5f65mr928511ejc.70.1707481270353;
        Fri, 09 Feb 2024 04:21:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXivyrCLacHlRuj7Sp0Dx3nYPXzt/1D8pekVDZ3Gm/TlsN21xNTfgLoKplBj/N4xhzw+8jrc7d0EJ/UZvsrNDxd+OBb9PY4K3poZUKFXwPEndzHOWQK6TfEZ1E5jwAyF95cWdk7wgEdMgQ87eUwcKp09iGxE2U6ds++2PH5Z7RTgGRvYWR6OLdf6K/v748jLHD3FvPmcLBNKERKLou31Wv+5AikH3rF6V06W3bVX02he0/tseLgnQwz2P6oe2j2NlZtMyqaOGmbbIOS7BHTlZYQLyYv4ROP/WfL1U2Fj6RaTLeMgcBc+Uxk9VuAATeX4fMffjYpyhUKhD38xFpyog==
Received: from jernej-laptop.localnet (APN-123-244-98-gprs.simobil.net. [46.123.244.98])
        by smtp.gmail.com with ESMTPSA id tz3-20020a170907c78300b00a3c019e8e4dsm221258ejc.76.2024.02.09.04.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 04:21:09 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: h616: Add 32K fanout pin
Date: Fri, 09 Feb 2024 13:21:07 +0100
Message-ID: <2716822.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20240209115759.3582869-2-andre.przywara@arm.com>
References:
 <20240209115759.3582869-1-andre.przywara@arm.com>
 <20240209115759.3582869-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 12:57:58 CET je Andre Przywara napisal(a):
> On some boards the designers saved on a 32KHz crystal for some external
> chips, so the SoC has to help out, with providing a 32 KHz clock signal.
> 
> Add a pinctrl group node to allow DT nodes to reference this fanout signal.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


