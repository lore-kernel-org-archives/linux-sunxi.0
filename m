Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FFA25756
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jan 2024 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h47Boc43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704788246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6w3leRHCC6CcQan4ottdZ6Fh+PPK3Yj5tZd7cVIuis=;
	b=h47Boc43vY2/lcbIHFR5BC3nhAMZu33gNLq5T0DhE/iG8Vgo3Z8iAB5HXZNG7R6JdxqbQe
	0w78rB2odYptw5b+k7bLU7sHMjj8ygjpfwv/rfuha6M+zxdAQWjL2Jd7L00GNVFMW7rUV7
	LVM14rnDa9670j+0lM1qcZiHXlVTPb0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-No3rHtm2O52X8OMt8xK_3A-1; Tue, 09 Jan 2024 03:17:25 -0500
X-MC-Unique: No3rHtm2O52X8OMt8xK_3A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3368abe10c5so1772021f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jan 2024 00:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704788244; x=1705393044;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6w3leRHCC6CcQan4ottdZ6Fh+PPK3Yj5tZd7cVIuis=;
        b=NcMq16Ti+qrHxI//oMrDduw1+gSZ5O2Bb1DtVV1RJUOGpQYi5f5RSrIXRe/J94irMq
         o6AGlHbejNlIUs7x8TZQrzplV+UQyuFLY1Nc90zllTu1F8DAFXtEEqm+dPqfkfQ3Wm2r
         n4iasf64UcriwUgA3Q9fRjjzXo6sy7e1f0hBef7XRDgecNvz5QyzBrSsyr1IqJVwFap3
         WKJIG6W4nO6md4T3DMxWxDSzkk3rs+0OBELDKNLl2dnhdsMiSEU1H7VyS4Nn9qBJanY4
         K+FG42ZAMZfmwhXgWIRBY+fT4ldJ4fM06ZxcwgX9JJQKWe7CnWz3WmRABp2dP+0HHrgM
         CYaQ==
X-Gm-Message-State: AOJu0YxuK0h25hHI4slTv9YNtRfINg4i3ydTsX/P6DrOz14gt3KYXEDt
	ZKvE/4NvPDNgd/5Um5TyLIDaL+Hbqwz6HTVnky/WBUP9Xl+8sRdknGFJZ/YGyDm/6DhJQQ2g9sv
	HFDdZ0PvmJ2+yBRid8CBAYDKe5AZSqcM=
X-Received: by 2002:a5d:4745:0:b0:337:5c95:61ce with SMTP id o5-20020a5d4745000000b003375c9561cemr198829wrs.97.1704788244102;
        Tue, 09 Jan 2024 00:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHStCnTO215moFCK9p8lkCQa0U7PamVTx0JKv0Duum5S0J8VtFtCBGfw0DR51jsrXawbtvNiw==
X-Received: by 2002:a5d:4745:0:b0:337:5c95:61ce with SMTP id o5-20020a5d4745000000b003375c9561cemr198808wrs.97.1704788243872;
        Tue, 09 Jan 2024 00:17:23 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m2-20020adfa3c2000000b00336c9ad1173sm1726260wrb.26.2024.01.09.00.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:17:23 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>, Donald
 Robson <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 "H .
 Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?utf-8?Q?Beno=C3=AEt?=
 Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Andrew Davis
 <afd@ti.com>, linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 04/11] ARM: dts: omap4: Add device tree entry for
 SGX GPU
In-Reply-To: <20240108183302.255055-5-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-5-afd@ti.com>
Date: Tue, 09 Jan 2024 09:17:23 +0100
Message-ID: <87r0iqrkdo.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Andrew Davis <afd@ti.com> writes:

> Add SGX GPU device entry to base OMAP4 dtsi file.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

