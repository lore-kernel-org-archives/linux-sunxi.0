Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F8443AD9
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Sep 2024 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726395175; cv=none; b=U94P6ICFX5T1fOFlHtfdqjKdGDGcPqUSc+TVQOnwe738pmRb8foDW07v91kNbiLGOrTrOH+Nq34M0cE3R3xff6uX+saOWoNVLxwMQ7vzgJQt28//62gy4Z29TUX0Vt3LuNWEPHl0ZXbsMiE5PKD3baREPGlqPfzbD0o7lIyE0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726395175; c=relaxed/simple;
	bh=YufrWgDvYHagdRJ8Eafei4Z0REg/DPXuZsNa6mm46Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWRu2yhGveppci1vgy4g5Y2iSuZyXpdKpkDXmEixqfi+/s6/5lltZf+W5E3KVeyaybQ1ERjsdzUjqnMnf0DeNP1z4QGayxmdiM4ZeiHnFKOS6euzxQCtSqQ7VakPQb05+XbEkANJ3+xeaslqhRU2Wi7l6VvaW+K93EPcYJNUeWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0+aDH5V; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0+aDH5V"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53654dbde59so4316830e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Sep 2024 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726395172; x=1726999972; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e3b+re0v8aGDDcxjlUeI6whVJWiks/9YnhQ8GIAVylM=;
        b=I0+aDH5Vv8yImPkBtmvyYrNagc5QCH4nII4tj7RFR3LA0k+wbSfx8SlEnk1rxHPLOi
         udgDL1CDqgb6N7TvkIHminr7t/5E0s+EHOCmbE+RG5FJOFpRyMCgP9X9P4LplYPTED1/
         dJOL3Anjd4eDFa+YF6SnnchfeBEHR1JzSSiww8gD7PiDic75NixkY4KX9HQa/6UM0yBo
         xxrFcKETmOAOP02OY5dpMuAOIA2rK+OMok2QoUd8dsR/p+F1rEvA2p6XvkfvN8En8suo
         X9I92cHbCh4Q9ZHZzLM1O6XYL4iRuaVEVL/IXHE9QcRElHGhLIUFTLBiPQN8Pb0liyeu
         2f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726395172; x=1726999972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3b+re0v8aGDDcxjlUeI6whVJWiks/9YnhQ8GIAVylM=;
        b=Mq8uKDgBwOxa1X5rp5+Xcc1Ri+jD0nG8y/EpeovOJvyUBwClmdTQ4vt+UFy5eIMkpk
         2WGj2+ZQCA5UZXOn7ImvEeFR2/3ij+qMBzxVlQf9FrnQbQPXLWbOUpUBCodh/7nJrI8y
         e9Z0Y+x2DTi8JdekmL07lPFbmnyxyqN5s+UHTo/4FxZ0CR5jhOAxTv63dytKGu4Z8Qav
         +ZZLToUknmCEFgKfKVY3YUU+eKdoh9nUNCGZb7Jv6nv9gxJVt/pRHfK6Zr5O8+UxIh8y
         Ha0RyWlkgXH0vop0mB7NHFza88wzcsM6YfY+WJJ+NZK80JdAOXobjlwqcBsVGYNyL1Rm
         GZSA==
X-Forwarded-Encrypted: i=1; AJvYcCXMb9QuPdWY8/KdFmmieHMiOaBD+57zjnpUfDhpq7gTI5OTJIqXSnD5XGZ/ZJB9azM8vH3CNm7g5dBSFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzCdZ6Y39dKIdGW0vusA+C4eo7fUQRKuEaVAK6ExWyHXoE3kxj
	YMXk8+DWxelLB6T2JZkEwvVXIi0Lukn1/OK9z9TvehXsTGf6DUXhr4QBelyN
X-Google-Smtp-Source: AGHT+IGFULRwl29+zBkgy+dcU0s4TIiCfqrud8aX30zIW4nAlXdSrXZwnP6OgjhggVHe0DMx5YyVYw==
X-Received: by 2002:a05:6512:3d93:b0:533:32cf:6420 with SMTP id 2adb3069b0e04-53679075a23mr3746955e87.8.1726395171536;
        Sun, 15 Sep 2024 03:12:51 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8635sm518588e87.217.2024.09.15.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 03:12:50 -0700 (PDT)
Date: Sun, 15 Sep 2024 13:12:50 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to
 PinePhone
Message-ID: <ZuazIgLz5PP_Z8Cn@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com>
 <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>

Hi Chen-Yu Tsai,

On 24-09-09 16:08, Chen-Yu Tsai wrote:
> On Mon, Sep 9, 2024 at 5:48 AM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
> >
> > From: Icenowy Zheng <icenowy@aosc.io>
> >
> > New batches of PinePhones switched the magnetometer to AF8133J from
> > LIS3MDL because lack of ST components.
> >
> > Both chips use the same PB1 pin, but in different modes.
> > LIS3MDL uses it as an gpio input to handle interrupt.
> > AF8133J uses it as an gpio output as a reset signal.
> >
> > It wasn't possible at runtime to enable both device tree nodes and
> > detect supported sensor at probe time, because both drivers try to
> > acquire the same gpio in different modes.
> >
> > Device tree fixup will be done in firmware without introducing new board
> > revision and new dts.
> 
> FYI I've been working on an in-kernel prober [1] for such alternative
> components. This does not require firmware support.
> 
> [1] https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org/

Thank you for the information.

I've tried to use in-kernel prober from your v7 patchset [1] on top of
-next and it worked without any changes to firmware.

Since there is still on-going review of your patches it looks like
it's to early to submit my changes for review. But I'm ready to test
your new patches.

[1] https://lore.kernel.org/all/20240911072751.365361-1-wenst@chromium.org/

-- 
Best regards,
Andrey Skvortsov
