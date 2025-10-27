Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80194315785
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587815; cv=none; b=F8gLITyUz4r4X4Ergo3AQHjvE76PpRneQB1J840mqxTLHrfIOWsPwmEJEREary1eo2j6OqcVAcSed0w8tI8twk1nsgMnE+KXNtATQUQ2/LsoOMlZKv21DW86FAHMdTL0DY7nVOtEp5MBaT3CU0s0E6npCHiWDGuluewJT4SguZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587815; c=relaxed/simple;
	bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eaB1cE9zOkyagu3lCQbLdAcL3KPHYGTa6PXaUCoBZYjg0MnsV5SVU1QCJaOnksROPumSBILYcARA1IGy6jSVYkE6PG9rHnTJFjqMe+3GgH6WWjGiJPyuhIMYVeJf8YGG4emalyh+59rFs0QiddJ/C7t1gZvQhyhcGTQczhnVtU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXukDoB2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXukDoB2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dae5d473so26858555e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587811; x=1762192611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
        b=jXukDoB2bauPmGw3wVZY97ZbORqDKljz+TGSKvGsf/7MFmduUolYEMxSMwAvcwi6ss
         XmjXQqI9NA5OTQ09u/5hJBimXy6oL0E9dmEgNJltKLpYHzuTxazGM85B2oiKkVBMPXN3
         SqBG/muo1J3ZNYHs+FM4wkcseZPWG/uSA1uPnMNNk/sZadUydJo/kjquMajdJwOfXaM+
         RHTXqYTyQSI5/qTCRD2HwwzNphqN5t9eb1n6axJSFHj68/P2RtWu7Y1fMoHpqIActAM5
         SJXvB9HOczK8XLKb09aUZGJzUW9aSFyr9XSpFn4qTIN6nxLQ2YByH6V4YxhEmqeg+dNX
         Z9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587811; x=1762192611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
        b=H8QyFYCijjkZn4dS3dsjyM/xEyIV1hzGfF0mu3htxDR+7wXbi0NPNY4GZppprtUoVM
         fXCY/LRBIyj/L6jZSxhD7mC48+nAP1TvNecURJeUySgYk7CjjgzgjTTV/Ry1yprQSZQA
         506CfVkIbrdFVRcikV0I0LFAZp1WNpYVuWkLb3FoQaLRkI1bIbm0HC8R5/imLSfELYn9
         hlk0MvNQcVPzSVR8w2KQVM+4skAwcSaf4cvvZ/rDHzX0vnkKVEzMGPJzBveG880OYRqM
         X74zEULKUL8yNT3jfiUTwtLbctfcl9q3nknRI/9qiyXNpn6bwfD+LlTB1p25BHv76f8H
         WDHw==
X-Forwarded-Encrypted: i=1; AJvYcCVGHC1xp4AJ4K4LK0PSAs/wk0lO6Snp5WaEQnOjmDjEP7n3RQxKwwSAIdq7vPr0NNAZfVvIg4CZzMUnRg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv8X463lZu/T0wWXmI4YRbRQhlQgmnj4iOh2T7BDWpj/vxrys+
	z63UGuUt1h4c/RhrVTLIzkxzlz8RwBRUPrjN/uvI+q3hfzkZTEK89u5s
X-Gm-Gg: ASbGncu6QoYTs7L8t+uy4HgJUZ+Cu5uei54q2q79fa28xhBgnldm0OFOyJ+EKs7mZA9
	TbOJnHuLv5SNC1h6XjmGDcr/8QdJ4eXiDEc/izYS5AUvBSBYSzE1aVtrhzkpti6M+tWefVf/9Fe
	NFnTHMqJMre6DxrWApYkgPhJaEGW/qsaQmlK3onwKxqDJj8JlwXRz6oGBuC02L3qOp8cyDHIA3H
	DxPMACh6atdj8zLNhYaYN50P42VkSUQzsw5VttI5hKiGP51DPHSdOROEJowopTWl3Mgpzi9retR
	5j3X6ZGXNeEcGEoxhlpL+GEQ7zW7pO6n41CqhrmZjTbG51HoJ2yS32AMkhbh/n0zpvTLw2/5s26
	cUFyXavhHAaRgw/qzG/awu1MMxeB3kC1UKBu+KPlRdfkGM8NPxGJE7rkcejf/O7fzwhKQSkSfdO
	vG4l0HnB+v+WUxnivd+/hk2w3PvBXlF1KJ8dcB0EtPDjJzPUhCUmbtixIzJg==
X-Google-Smtp-Source: AGHT+IEihm/mMfPTi4flOTdp91sIkNaqwi2a8InYOu2pJ2ai1utyKQHaHYaafUG+/91FRnDBC8gdGw==
X-Received: by 2002:a05:600c:64c4:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47717e512bamr4754785e9.27.1761587810623;
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4cc596sm152270065e9.15.2025.10.27.10.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 04/10] ASoC: sun4i-spdif: Support SPDIF output on A523 family
Date: Mon, 27 Oct 2025 18:56:49 +0100
Message-ID: <6204310.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20251027125655.793277-5-wens@kernel.org>
References:
 <20251027125655.793277-1-wens@kernel.org>
 <20251027125655.793277-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. oktober 2025 ob 13:56:45 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The TX side of the SPDIF block on the A523 is almost the same the
> previous generations, the only difference being that it has separate
> module clock inputs for the TX and RX side.
>=20
> Since this driver currently only supports TX, add support for a
> different clock name so that TX and RX clocks can be separated
> if RX support is ever added. Then add support for the A523.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


