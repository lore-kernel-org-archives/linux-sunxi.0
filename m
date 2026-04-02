Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D84286D5C
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Apr 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134859; cv=none; b=GyhqK3M75mN3nBket6EGEUMX4oarMBQPwWN3Awq0PIBk0rTvfavTw/AsG1V7aTmsajHOswFKMh72W0FDRyv9J3gI1mTeKweCrJagGYJOXPd+Gqa5F9PZduHjrp3d/fR6GHIwQWahEViMHO9w6vBUhPia/C7o+mpcdaygBcWEg9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134859; c=relaxed/simple;
	bh=P4aQMbaBnnxQLePUnINQzLxACT0pK5SmCXI4vlruYo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZviADZOeo5SAzQGKKufe1Tarf6jxnWCpCmX/FLLX404A7WcZZtiBX+jWtgCp1cbbGGvKnE0zVTBlkwv9qCZR44v/PnW2PPoBgts6RbEkH+uOuszJAypDXBygnf1bS4mMEyeF3/zxumV1WSifaj2hXl9HirM2eml0kB+uiDV+YaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyffRfbd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyffRfbd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48541edecf9so10148205e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Apr 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134847; x=1775739647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=UyffRfbdjflkA2XUFg2XkCLD9b0ikEr8Pv8hW1+0hURjNwq3t124qhR/N8VcuVNrTT
         TLscR5a5uskjyuavCnnnT04hHSDSbCTRcA5ZYQb4FKpqYxuKwYT0O2BRTm0Idc0mubLg
         y8U/aJBPdjzbOGl4uc8eRgq3C0kR/ojoIi3Fr4V6bnTgY9rTGLuNqwKxgL36vxVFBLfB
         0ZtnFlf6iAR062jJffwK9RlaLy9HO1Ni7EQyD+n6Qx/FfhHj3lckhIjN6AoK6MphAkxp
         49QW/VQwE6GVEMIlk732q7I2ACeG6CeOi8JpGOapnddu0EP2HHSSYkB1jO6fgLjzsoAj
         ZpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134847; x=1775739647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=LhP9n+QI2l7YIEecKcCexXngfJaC/5MNifPjkb/SDVlzDZ7hQyAmH+FrUPdiw7/f70
         8wkTkiNMFSls8+Nqnk0GEsUtfqt8mwixWRI67ikC6KtgOb7NYIL9zs/S4cNWOUzFnGPf
         h/0nBZT/WUb7dXoWx9JmpTvLogS4cA8b+eOZFc+kcLAT+IkftYUOTdeEEWpPwrFf1IJY
         DXB2dYjPBrt65SyeCxf07CEes2LyYul0doKcUE1rsTHq1ApZLcZLZY7bPLWCWf4AwGD4
         XGOUOKDc425GOMgGrzJ5/5UgfLK8t0SpJe8ihJGaW2VhXvH6DLaLPOvao9uebmlvTdmI
         dC8A==
X-Forwarded-Encrypted: i=1; AJvYcCUbMCGTGqOHw+ft8yzosYbzK0KpwbxhetCPNB4gdFHyNnBe7uqV7cyg6RJO9pQ1wbKER+j8eqZKUgcd5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr3odShumZ2/7ixE9SWoF7OJX2QrrsB/n7K5f59GiSdM2dBymo
	wBQ5Mw2QXUVPKb0LM/F8uOpmyypUnSXqCziPx+WDu3G654w42/L/A7Y/
X-Gm-Gg: ATEYQzzfjwejXuWs4U0VryuXvli0TY9XjnUjaH845eddzu+AUF2pZRbzo/rSfgAlEyU
	oqg/p0HZd+6hG/vkInn4pbF1wYwk04Nf8obJgVWujDmjtdmp/FVijwISXbBOyu4I+SG2ROg1JsG
	bCFMDpKGmEnCZgQ7DTjuHKK6/QpMp49gD4XyYUhOVVGMVokGNgsBLgUmvUkzClC8ntIgPOuYipj
	ss++70WnT4wnqZERsIs+9dEykhkQqs97rLTdqXzMpi4vfIylDZLP6rMRE5/H3Rxop6v2QCPPurY
	Y5IUOjnBDQ+Yv+UXGx+5vdGS7t3ziLtVRXd4dhHLdj69wWclodMq4FWgWskVYjlLo+H4yfknUor
	hvW3c/ZvfgaONU1lJEQyMAICeuxYjfGmvVRa4zjgzhHlS4W608aBVyC2ASbos08UjT3fxe0iGk8
	uSSqJkjUOK3tuAQBA3j0A=
X-Received: by 2002:a05:600c:8b83:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-48890ac91bbmr39369785e9.5.1775134847181;
        Thu, 02 Apr 2026 06:00:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a626100sm121462725e9.1.2026.04.02.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:00:44 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:00:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <ac5oecJ05oZD25VF@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>

On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 

git am isn't set up to deal with two From: headers.

> cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> like disabling runtime power management, releasing claimed sram.

The first part of this sentence is missing.

Otherwise, the patch itself looks okay.

regards,
dan carpenter

