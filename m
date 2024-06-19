Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33BA193
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718766977; cv=none; b=SYIUw2LmOhxd66/zWPJPHLMyORI+TV2csSkQVn6LhlNcUINwOm6E5Abl7JWg3+osSreE9D4hm13plEju5pq69lZYhLhcsj+Bdy0Lu4+pIQlvkfIjTn8NJruq25wG3AQ8QxJQrxUBjAQfDZAA/L957dUfmSNBEVk7kSwCEq/W6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718766977; c=relaxed/simple;
	bh=70o7K5jQp3qCO2paDWj4TSRXHc3qmEa5Sft5Sce2C00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaDrCL9dnvziogObKpEf9eC5sfXjCQp7ngGnNxvcOj5mCzxsFWJrTxjmxWZq+LGVBKPTB5NXbQCqSrvxLs9WdDO10jG2OkIiXrNikMSEkbYkvkFU7ktvVm429z1TBYGREmDjTxxKqqzdgkSYrC8iV93P9cj/qyTGyUkl4xoVRKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXIbYJBh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXIbYJBh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f9b523a15cso257995ad.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Jun 2024 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718766975; x=1719371775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pRdfbAX4uRhBpzI3kNcS/MftxJmx3MFgB+9fN7FI+4=;
        b=zXIbYJBhvTAPorqH2CyHHGDu89574grIesTpHSYx1oIjkgMcGEve9ya97vWCMy0Z7D
         phcbPOpw5V52S1OACff1FWbF0UnDHjStxYc0ToIkpoeQt9Pf0CbD36GFLZz+n68Ga1t8
         bLrdGy3lJrtJtRyuGQd7PD/Hm6OmW8jZhuwgtbnAJRu2juoQ9FG0xIch1zKgnKSeElsp
         KmKLnVHpruiYrbIuiYPi+KQjRyf7QUfaN0sYIhRD3bjNvxObcH7WZFMqAYDRRBrXrKDy
         MgephHujRhSnItQ1iwYYiFizR4lTBzOIbpkbYu05NkURreZPS+673VcEe3BjXuzo42lX
         JMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718766975; x=1719371775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pRdfbAX4uRhBpzI3kNcS/MftxJmx3MFgB+9fN7FI+4=;
        b=NJ8zxYm1qXeI9re11zkYEg1uo72IxICXAJhsATPuU4UFJFwvd09hY0EMHtXMFVZj0n
         NJgOQ23g+80v4lfk562JJqnnzdb1NTifLDsSZ0W44HcMKsQgKdtxmAv1qXRgGJB7sSL0
         UIA0EL71LqLNwsi6P712dCvUtbxoQ9lvXfcO69Uma7D9mYICwr+YCPTHRY3az4ltKSv2
         C417REg7yqNRD1ubh4nIzd3xpA2A1ItFuV3J4kbCoVLmFLHdTc9h+NduxxTA6cnaTsUL
         eQnd5wnmy7IJEQlfX2Gylf7+rkaSVgt3/0VApZfqTfbYijrDHu80AgbrNhJbNRx4yd22
         Pq3g==
X-Forwarded-Encrypted: i=1; AJvYcCV3XNIxHc4K7vTJ/g46yGZ+V4mCgRvsIgDni5rXeTqP3J7IMq05kGRvx9u/OZw8sf/+aleGILGKt1ylX5N3/l8ywkd1iJmSqaIxEBk=
X-Gm-Message-State: AOJu0YzBDY/oo5n0X7p6MQJkfjX2AL5IJDLuUIq7YyQkRRTSYhuv0X4x
	AnI7IPAxkcrR9WqEfqGiYPru+f5a+xzbwK4p0X572PcVnJtUDUS8P+cFQk5MduM=
X-Google-Smtp-Source: AGHT+IG1H/m3v8hmgPXuNYLHmkG/3ENRpPzfQEQ+VxQcJ425m8/2HiHdp9gAl3MGHr8Qygz+XE4uiA==
X-Received: by 2002:a17:902:daca:b0:1f8:66fb:1679 with SMTP id d9443c01a7336-1f9a9274fb1mr23236235ad.30.1718766974750;
        Tue, 18 Jun 2024 20:16:14 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f85b4eca1bsm101487975ad.146.2024.06.18.20.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 20:16:14 -0700 (PDT)
Date: Wed, 19 Jun 2024 08:46:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chris Morgan <macroalpha82@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] cpufreq: sun50i: add Allwinner H700 speed bin
Message-ID: <20240619031610.t7tsls4ub6vdluvq@vireshk-i7>
References: <20240607092140.33112-1-ryan@testtoast.com>
 <20240607092140.33112-2-ryan@testtoast.com>
 <20240619010021.5962e459@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619010021.5962e459@minigeek.lan>

On 19-06-24, 01:00, Andre Przywara wrote:
> On Fri,  7 Jun 2024 21:20:33 +1200
> Ryan Walklin <ryan@testtoast.com> wrote:
> 
> > Support for the Allwinner H618, H618 and H700 was added to the sun50i
> > cpufreq-nvmem driver recently [1] however at the time some operating
> > points supported by the H700 (1.008, 1.032 and 1.512 GHz) and in use by
> > vendor BSPs were found to be unstable during testing, so the H700 speed
> > bin and  the 1.032 GHz OPP were not included in the mainline driver.
> > 
> > Retesting with kernel 6.10rc2 (which carries additional fixes for the
> > driver) now shows stable operation with these points.
> > 
> > Add the H700 speed bin to the driver.
> > 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> Yes, 0x6c00 is the value for the H700 SoCs in the devices we have seen:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Applied. Thanks.

-- 
viresh
