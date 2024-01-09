Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A274E2575B
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jan 2024 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+meWEu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704788315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ncd94wXhhDxJblqZIyWiUNiDC2N6QYCqIvUVHIfpTbw=;
	b=J+meWEu4yVRAXtXnC9NxYhRq3MelAel47tVmWYVTW+uubRghMH2inwFTj04rhkT2tZtFYY
	HB7uJSFOu6yx1oyCvT8hCuyQfJSQwQ2KRCuXyooUsXecxeVYGE1s0oOOA8VfII/JSO/2At
	XTDZZyao/p0v8Ggf1X9fpEgbVs5J5G4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-sz8ffLdqPWucQs8QaQ3A_A-1; Tue, 09 Jan 2024 03:18:34 -0500
X-MC-Unique: sz8ffLdqPWucQs8QaQ3A_A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33768a5f55cso1246619f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jan 2024 00:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704788313; x=1705393113;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncd94wXhhDxJblqZIyWiUNiDC2N6QYCqIvUVHIfpTbw=;
        b=Ev3x4X1CJSGFEDBwqHzrvSmabjU6g+yCVVTAaJKd4Ek83nRigStDVtbvhfiXfO0juK
         KuN7652OPziZRsveRKj9XY9hTB6wC+6vHYvewh6QO24xvwNwbgwGuaNSCCF9I03Zk23q
         7bsqqmoFClSELxcHwCF/olvK7AIdGU2C6dCbum7DEb8h85LHMo8Kk87Cw7d9EHs2fXih
         VBX9O3X0z12EVxCGbqCzyjVu/H7mqEFwIHaTy/RtIVslBd+l1MqpwMCC0LfTf+N+4MPN
         W66J2zvsYoO7CZWl1LF48xr2RGIPxFAEkYI0gVsyin1UEYREniEFedMgggjHStBNkvJU
         ukyA==
X-Gm-Message-State: AOJu0YwycvXieY26GXJcBJTNmeCOHMnyF6m2P9BHxr0C4eSpMYz8ZjOQ
	pK0D1TZq4DtA+SW12PS4MaF6VxfVPJsJmBmLgv7/6dL8qjDCC0gS/zlGOfo5mBUIca8ZJs9Z2Ku
	Dj7jQDOXQ8a6WAhkslQGCQYSFnEA6knQ=
X-Received: by 2002:a5d:594e:0:b0:336:7bd3:9520 with SMTP id e14-20020a5d594e000000b003367bd39520mr368575wri.43.1704788313424;
        Tue, 09 Jan 2024 00:18:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr2QE7CGw84chBFdWabSEnoMFo4EBSyeKmioKe2kWujoaALuS+Y7Lsnp8SKpon/RIw+U6z1g==
X-Received: by 2002:a5d:594e:0:b0:336:7bd3:9520 with SMTP id e14-20020a5d594e000000b003367bd39520mr368545wri.43.1704788313200;
        Tue, 09 Jan 2024 00:18:33 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d420a000000b0033719111458sm1704583wrq.36.2024.01.09.00.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:18:33 -0800 (PST)
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
Subject: Re: [PATCH RFC v2 08/11] ARM: dts: DRA7xx: Add device tree entry
 for SGX GPU
In-Reply-To: <20240108183302.255055-9-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-9-afd@ti.com>
Date: Tue, 09 Jan 2024 09:18:32 +0100
Message-ID: <87frz6rkbr.fsf@minerva.mail-host-address-is-not-set>
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

> Add SGX GPU device entry to base DRA7x dtsi file.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

