Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF718991E
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726666914; cv=none; b=JIk+Z2HYMqu/6B7T4RkNvmCssZJcwPKgNNeFH4pW5maLe0TjVGdruqmslVVAJBvjBmzRzNel86f52IsScK9ZT64oih6pPmpoQtjJrfDIzMGOQ4srfvVDkMoXJqzIjYwpA0hVlITzna1lFz+HiKIdqh24V+5cOKTYcV6pLE2E24Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726666914; c=relaxed/simple;
	bh=QZGcPNXNweSx5DVUBRxDur4dFEPKdFU2/eDI0Xx0uMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R45J6ploAjyq7uLgg7lsyWtB4A5I1BB4Kl4osvEcM8UrbuP44cg5i0qA+t6py2IV300P1JzbOhNtlDigpyMsJVEz/VxfmKJfH08ROU1Dwl5dY7Vy0rkwpc8xFQamlleYE8RZ1+dOgJSU8eCa7ebOHE2Z7N5MVKnf4oYtLbfDLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2gUsnPh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2gUsnPh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365a9574b6so8615697e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726666911; x=1727271711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY5fjMhugvxOtRn3XdK4oMNzOo7yd5YBOQwW46C1SFU=;
        b=V2gUsnPh92MKs+Qre/DiPuQjNY9zqEEk+hcaw5gVdTJNffDDq54SZ2Pxc4mRG54pua
         0qIU6beqQoq1p7JQttTuQ7eC2g/Ng5lW7H8t7dHqmJBlSZ023eVJMcMsC54GK9xx74AK
         4wp132Eb4ZcmY1t+D5iRc7BWKMZ0e7wrKGSN5fkbl3KfVWxI010eW9xoTZgVNqcnUPAl
         2WjaN/V0WlLy6/LuKIkOdtrswp9lonMrS6qgQUZpaTcAR1nkMNgZWQ8bEQyNJVeyL2NB
         os7hRDW1egoXKlkLQZRwdbxWfqTqt2Fpj5yl0bEKywzgGW9KBOTSHAfNnt1oWo5ijRcS
         pyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726666911; x=1727271711;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YY5fjMhugvxOtRn3XdK4oMNzOo7yd5YBOQwW46C1SFU=;
        b=KiGn6415EfI5KhDMMNO6ur4nNPCMg4uohFoDe1K+lQCz6ULHRYNZZG2tk3zK51f5lM
         2VqAsfoR71Vo+yoh5g+W5A5P7n4zs/hA9zHucd7w5m5ed3qaFBBj+oFH5f3a62g75F/f
         HW4iIA4w1JpnX8NQqXMUE7IOxB8doI60T8OqG5Uy+ChB9iCDXK3HvI1d62cO01Spuxdd
         3kmV5bHryf3Nt36HliIfAaY+5jrg9PQlVuiMY9VRiACrpyDkiuAc1OkqqGpzKP72ZhsJ
         LCqa/vIOvUAt6GeKpw0jIM9q7mFNLX6FnFhRGdFw0pYLNZhHeAlgKOx2dglHUTY2WmrA
         o06g==
X-Forwarded-Encrypted: i=1; AJvYcCU58b6F4+4RhA8zhNFc76qccyrhlzxLqryunXTaNnOb0UtmA2IblRhvn2Bh3K3d4FpBvuJskuisb16Mnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb1KHtvmZCsvJyTPqg7HLY7nhxFd/XxP40hVb7cg1jbMepwowo
	197mh5NLnE7Qwv6JeVx2wcZh9TvCsSW4/FyUwwHaxC3EjXBMQ1n+
X-Google-Smtp-Source: AGHT+IGJPlDhWmbSrgnN5jY/pQxEpLZg/M92xSm/3MhX8NPG55UAA6a1JTCbvH8r3kBfigS6vtTIew==
X-Received: by 2002:a05:6512:32c7:b0:533:4620:ebec with SMTP id 2adb3069b0e04-5367feb9639mr15152534e87.3.1726666910279;
        Wed, 18 Sep 2024 06:41:50 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870bb955sm1514485e87.301.2024.09.18.06.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 06:41:49 -0700 (PDT)
Date: Wed, 18 Sep 2024 16:41:49 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: sun50i-a64-pinephone: Add mount matrix for
 accelerometer
Message-ID: <ZurYndjVz7r0U6dz@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
References: <20240916204521.2033218-1-andrej.skvortzov@gmail.com>
 <6e5d0e9978bff30559c17f30d1495b59@manjaro.org>
 <ZunCysUTSfQU1ylg@skv.local>
 <c7664fda936d36e0d916ae09dd554d2e@manjaro.org>
 <ZuqyuvZ6tdzp5XSW@skv.local>
 <8df5fc79a3e899738aa944a290774c72@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8df5fc79a3e899738aa944a290774c72@manjaro.org>

On 24-09-18 13:27, Dragan Simic wrote:
> > > 
> > > After going through the InvenSense MPU-6050 datasheet, [1] the
> > > MPU-6050 evaluation board user guide, the PinePhone schematic,
> > > the PinePhone mainboard component placement, [2] and the kernel
> > > bindings documentation for mount-matrix, [3] I can conslude that
> > > only the direction of the accelerometer's y-axis is inverted,
> > > while the direction of the z-axis remain unchanged, according
> > > to the right-hand rule.
> > 
> > yes, it looks so on the first glance, but in MPU-6050 datasheet there
> > is also following information:
> > 
> >  7.8 Three-Axis MEMS Accelerometer with 16-bit ADCs and Signal
> >  Conditioning
> > 
> >  When the device is placed on a flat surface, it will measure
> >  0g on the X- and Y-axes and +1g on the Z-axis.

I'll try to explain how I read sensor's documentation and what bothers me.

Picture 1.

up

         ^ Z
         !      
         ! X=Y=0
     ++++++++++ 
     !        ! 
     +--------+ 
         !      
         !      
         v      
       gravity 

down

Screen (drawn as ++++++++++) is looking upwards. Device is on the flat
surface. Sensor returns +1g, although gravity points into *apposite* direction.

Experiment:

When I put PinePhone like in the sensor's documentation with the screen
upwards (Picture 1), gravity and Z axis point into different
directions, I read positive values from the sensor. So sensor works as
it's described in the documentation.


> > 
> > So sensors reports positive acceleration values for Z-axis, when
> > the gravity points to Z-minus. I see the same on device. positive
> > values are returned, when screen and IC point upwards (not the center
> > for gravity).



> > In device tree mount-matrix documentation [3] there is
> > 
> >  users would likely expect a value of 9.81 m/s^2 upwards along the (z)
> >  axis, i.e. out of the screen when the device is held with its screen
> >  flat on the planets surface.
> > 

how I read kernel documentation.

Picture 2.

up

     +--------+ 
     !        ! 
     ++++++++++ 
         !      
         !      
         v      
       gravity, Z

down

Screen (drawn as ++++++++++) is looking downwards ("its screen flat on
the planets surface"). Gravity and Z axis point into the same
direction and it's expected to read positive value.

Notice, that Z-axis on Picture 1 and Picture 2 point into different
directions to get positive values.


Experiment: 
Now, I go to the real device and check how the sensor actually works.

When I put PinePhone like is described in the kernel documentation
with the screen downwards, "screen flat on the planets surface"
(Picture 2), gravity and Z axis point into the same direction, but I
read negative values from the sensor. So the sensor works not as
expected by kernel documentation, when I understand documentation
correctly. Z-axis inversion comes from this.

> > According to that, it looks like Z-axis here has to be inverted.
> 
> Yes, reporting +1 g on the z-axis with the device remaining stationary
> on a level surface is the normal behavior, and the returned positive
> value actually goes along with the quoted description from the kernel
> documentation.  The z-axis of the MPU-6050 goes upward and out of the
> screen, the way the MPU-6050 is placed inside the PinePhone.

> > It applies to other axes as well. And because of that I came from
> > (only Y-axis is inverted)
> > 
> > x' = -y
> > y' =  x
> > z' =  z
> > 
> > to inverted solution (Y-axis is kept, but X and Z are inverted).
> > 
> > x' =  y
> > y' = -x
> > z' = -z
> > 
> > probably should put this information into commit description.
> 
> Wouldn't inverting the direction of the z-axis go against the
> above-quoted description from the kernel documentation?
See my comments above.


> > > [1] https://rimgo.reallyaweso.me/vrBXQPq.png
> > > [2] https://rimgo.reallyaweso.me/uTmT1pr.png
> > > [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/iio/mount-matrix.txt

-- 
Best regards,
Andrey Skvortsov
