Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B714AD24
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740918087; cv=none; b=Wi18LYZwedJxPuBaExvFWiy7IK0jvcmxHBsFrVUlIRG4S3owAXC9Bsf6awTXA56/nqWuab4t7k+tV5B/60c9RAfzDp13OnPc1RxiD1xxmj1EmV88U/w5UKScsbCI4JD+maLXmD8vEyL5U+jfkBU3cwc9NWP10JOGa00MihgyVLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740918087; c=relaxed/simple;
	bh=VXo9YiQuucOHzzLu2O9MNDIOz3v9HB4UDsRrEQnruDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIAPzhA4VKHGBdE4bvtmUi+yEcLuz51+tlFhdr+eGODdlZiXRMsu94irGnJA73gsgYs9GQ2kg80BGVUZW3pOD4nucwg1J1oK8ne2NSc5zAa6XFj4XZlb2MuotqN5gBPW2b2FLcOhInQWM+4aiBdJFLkia1TPwmVcFgscUXPOENg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuntkcKJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuntkcKJ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54958009d4dso1522222e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 04:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740918084; x=1741522884; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qtblm0i8462d3luljoT5Tnt+0dpoW1Tx169HXsD42sU=;
        b=KuntkcKJKpkL91LjTIvSB0IQaqCZKeAW3mHvZwzVN6p49V88NYEOoG94uq4Fhj60CQ
         m326C8l/SyebYQ6HOiwfvB7vzbhQVAuoBDre/1LuzutkLDWGUMHz8ZDVVBwY8wAqhCkP
         U+K0IqeJJOY+5fh0SrVgsiL/N/psYW+5TEH62vNk0vAXih7/gZGB+ayPPetQXvCmqVSP
         xo6Szc+QCkxXWhJ/XXY33m1ys8okoRNmkqUWULKa3j4Gt6V6J9wKJkhRoHK8b7YOx66w
         cqMYOzlfzLnpro4+QxPQuyBzyXb5lahHHANqA7OesmgX/V51QgGNO+sE93q8VnYckqAv
         3eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740918084; x=1741522884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtblm0i8462d3luljoT5Tnt+0dpoW1Tx169HXsD42sU=;
        b=BSXyYzzTV+V99hhKYLIs4aoCNtRicHa8EiBmFf/3YczLSC7njjI02J5dUWKMw2ItB/
         o6IyeT5TgiviwkKoRPnr533VcuMOI8IE07ZloIR+/vfdM8gYcCW6vAY5IFYSIy1Mjnp/
         174KXLwziXv8ivK/wM3OipMkT8fcFNTafaQXmueXWrrSkEt+gpiwuNhXBR2yn5WaTIuT
         VXbPW8IYUf06ghRkcy9tzXuj+SQi6SK5Z9ybsbJqSKqDpuN+WvMNAXsYg0tMju6hlkis
         VobZz0Ei5myDb/cP8yTyxhOWoyIZJQckZbhErofDdNR1PhMhJKi9hCPXYwdJr7p2l4+e
         eGig==
X-Forwarded-Encrypted: i=1; AJvYcCWtSHOrVQa5exKeVsfHEb/+K4mnUP9Ipx24YRzFPnv4IoSEJwnpg0SaOmo5sI5Uge1nYi6V4wwDY13MPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+McQdr8ZDeOrv5/5+FtmDT91MtbA66s9pKpgTDG9NfdZwxRAP
	1Tw06sB0qXLpSPHdV/nvAeuTx3PQl3XFfHKFWMp2uog1sGz2iZXh
X-Gm-Gg: ASbGnctQnjVQe/Y4yC350dyDymbRwl1Uo1EcSk5efHrqKFbGvOJ5DJJJEPENy+C4vXh
	fAAkrVwG7L7AeJlcMSil0h0EacSz6TYJnvbXs/4gLBhmWsrSuTMHhtVvICgsjY+6lkDdcBnUS5+
	svQXTg/CfL35mMbp1gY4EEX4/Qq6o5zMYjGPsxrHgjHKGyqcWFzt0SBlit+NfoxxEYAJlIeAWgt
	FzIYEKg3aFDqA+r18npvc51NldNqOMK/jGfzpH+b1KGY67aOGLypldjtQGkTo6LrnmE13rqWfDQ
	pwVq5ByUAhIc7l+f5oESxj0JyWdGQjziEvZ6abvlFzR7gtA88B2o4yjGxD1/5GgIHGE0LFcnIel
	mTTaOIX3gdEiy1QEkzt/7adnXnw==
X-Google-Smtp-Source: AGHT+IFo9Y9R+GJf/hvtgnPwl3vpc/B4svOJilmVq9Mn0xTVT2iqrfrmQOieXp0GoaVbPJJmjudwkw==
X-Received: by 2002:a05:6512:3042:b0:545:fad:a757 with SMTP id 2adb3069b0e04-5494c335f2emr3260926e87.29.1740918083926;
        Sun, 02 Mar 2025 04:21:23 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495dcba076sm272177e87.119.2025.03.02.04.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 04:21:23 -0800 (PST)
Message-ID: <863ce320-c5cd-47f6-a66b-c43fac98a4b0@gmail.com>
Date: Sun, 2 Mar 2025 14:21:20 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Rob Herring <robh@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
 <Z78g_uiXumn4mvET@smile.fi.intel.com>
 <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
 <Z8B7h4_IWz43gFhO@smile.fi.intel.com>
 <c9424f3e-1ff0-4c01-823a-19801cc3e7a7@gmail.com>
 <CAL_Jsq+tkXAAVK2D_AtENuXJZOF2eK=sUnjv3=7PM8nAyAB7Xw@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAL_Jsq+tkXAAVK2D_AtENuXJZOF2eK=sUnjv3=7PM8nAyAB7Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2025 18:59, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 9:06 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
>>>
> Sigh. This is not that hard.
> 
> - unsigned int num_grps = gfar_of_group_count(np);
> + unsigned int num_grps =
> device_get_child_node_count_named(&ofdev->dev, "queue-groups");
> 
> And remove gfar_of_group_count() of course.

Thanks Rob. That's what I (already twice) wrote I'll do:

 >>>> alter the gianfar code by dropping the gfar_of_group_count(),

and

 >>  I prefer killing whole
 >> gfar_of_group_count().

I just wanted to understand what Andy suggested.

Yours,
	-- Matti
