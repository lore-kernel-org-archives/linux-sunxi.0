Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205661FC3
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Feb 2022 04:26:17 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id v14so62474oic.6
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 20:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RY42s9XP2vCaExmg8SW1b8959hPeZEJSy7UrnQIOnSA=;
        b=JvejWtnqzAJkoIgn8NJ8DU5qzp0fHD2Zi41OogWhqIfNYhxNdmwdKUVcs7GRmA4rKY
         suPtkCqSNRDVwsEBPG6EExFAycr35RIKSwprEwQH1zohlyqqlZxZh6f5Qk0Q4/fG31Ha
         I4fOstVhX55t+aOotFHxE0RzOeff+hGm3EhogS7Ow6Mltk0li2itQgWm9A7ViB7DTLI3
         OD29GMkEXGLSpSFsaZjURrEbRaLdo9uNgFOrayZJXuggRtaJSagZB65fyjagbctG1CRW
         L2qBogykcYAZgfHnoln87uG6FlpU9Ggolw3Mz6t5vntOsJMoAsFLr9OIVJNE6CGvDv8j
         xZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=RY42s9XP2vCaExmg8SW1b8959hPeZEJSy7UrnQIOnSA=;
        b=dK8aAkoieD62DNarawwA8WG9Df2+um6uSxYQSGeU7ibZcA7HgSLGZO5gLouKVGIAir
         ebqPsU5qscWPLv4M/O0Qz8f7KrEQ9EFuMIvPfUlmtZ11Nv4ZtIf+8WUAK08mnsfzZSNx
         lY9r4BqK8tsD5PGjnMIzOfCcNt6CYI0l4ou0eSTZXCGVvJ3lli2s7Mgn6XGELtCnS23F
         ZFT8amBgtmMmSild6EIYNt+1zZ033IiU7j6tipNHshi5Gwi5O+X8cOXDQDIOU0S440nU
         pfio3RXGVWMu1Is+smv1+Ycf17kAy+53v1Reef4RJIqHa6cwMYPDngZ6K7kFwxz8/9qm
         kh+g==
X-Gm-Message-State: AOAM5322Ovi0DRiXHg2AlqOZdDrBo9LsA/ZOYcevDX7ynBghF6UY5G1x
	DJ1D/aCeqWhZZAbAhdWcj6E=
X-Google-Smtp-Source: ABdhPJwEhTSlGLzNvGzaceF503qrsfiNuHkumbVADHWU2qQ9wQpGTW305eaFMDGQUWBoYy42lKmghg==
X-Received: by 2002:a05:6808:f8d:b0:2ce:7461:200f with SMTP id o13-20020a0568080f8d00b002ce7461200fmr458038oiw.285.1644985577184;
        Tue, 15 Feb 2022 20:26:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b8sm4973952otk.36.2022.02.15.20.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 20:26:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 15 Feb 2022 20:26:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Klein <michael@fossekall.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Adjust power key nodes
Message-ID: <20220216042614.GA63304@roeck-us.net>
References: <20211129165510.370717-1-jernej.skrabec@gmail.com>
 <20220215002732.GA3215504@roeck-us.net>
 <4714494.31r3eYUQgx@kista>
 <23df0d53-d530-2363-09c9-5be2b2306a81@roeck-us.net>
 <35ca9258-3129-240c-7a0a-cacfa0a13253@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35ca9258-3129-240c-7a0a-cacfa0a13253@sholland.org>

On Tue, Feb 15, 2022 at 10:11:36PM -0600, Samuel Holland wrote:
[ ... ]
> 
> I don't think there is any real issue here. The two irq_desc's being locked are
> always different, so there is no deadlock. This recursive irq_set_irq_wake seems
> to be a reasonably common pattern in GPIO drivers, and several of them contain
> code to silence lockdep. I've sent a patch adding a copy of that to the sunxi
> driver:
> 
> https://lore.kernel.org/lkml/20220216040037.22730-1-samuel@sholland.org/
> 
> Please see if it works for you.
> 
Yes, it does. The warning is gone with your patch applied on top of linux-next.

Thanks,
Guenter
