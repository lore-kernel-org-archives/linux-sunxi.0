Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110C156237
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Nov 2024 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732080977; cv=none; b=ezT13grkjoUknmTeXA0KdaYdTOQTm9q+XaK4NyC6yaGP7mYKfO5CQeNAj+rlatRH1bw/ba3JvGIw1ZGG6bVWy5jAmwwvE6fFAOdgLTwVrP6r0D0s/YjGP+h7EzargiLGOuSJkKeDvjvIDgnE+/+nZTeMYZz6Yg83gkDuhaIFUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732080977; c=relaxed/simple;
	bh=3mq5+iqMIwmAGAbAOZ3WJy+zC/nZcG1A/YxkXZxMR4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASuemP90oF5MLctoaOvOXpofvMyxaw7doCicVP/ZNzJ+hO0kYhQ5Cv6Q820o2lHvWFIu5F31HhN5tSrxumXGhdV9yOj8V34rYz0mKtDvcE7Mdfxg012vb2LsAR2GKPXVuqlBDbfNvxcDuRxHH6wdeRPh4xvYDjtX96Aenjxzw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw6Fp4G5; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw6Fp4G5"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7180e07185bso748968a34.3
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Nov 2024 21:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732080974; x=1732685774; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRwcqVhrMWWtuyE+OLPL5NHoUdOo/BxzRoMgxzXnrkA=;
        b=kw6Fp4G5LnUoNEPlJCuv52opoQTh5HR6O1k+nNf6QAlpNTEkc/x9ZvVx8YAt8685uU
         kTmVk7Z0yA8k7JE2iif5rJxboYX69KyfFBOi9xxYdDzTOJJeM8dmCz8r3y/CBcQ/9Ty5
         +TPK5A/Yu5fY/fYxv1FTvY0XcXPBhXea+AjyA2M9KF7psWFSw91yb/VdJe6Kw4Xp5pbh
         g7l7GYkv++2PJFP7eWnevs7khKOjvJdWf86aisjodB0TsOcnERZuJwCPWB+WpBlvrh9w
         VmcMAClDpcv4SvG+c5W94i4KQrQR4n+iyb1zKn1Z5WwDoLebj2/vF69nj/4lbdg2tOHV
         62Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732080974; x=1732685774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRwcqVhrMWWtuyE+OLPL5NHoUdOo/BxzRoMgxzXnrkA=;
        b=d3zI1fil2JNeyw5r7qgiwY/EFenEX4yA5SuuhshegLcLyGCpE0qKiPgjHiYnbhRXMp
         LBU7zs4OvXKfPWxyPRgqH+xTODxZRuJRQuzJCAc+4cqO30+2o/jfwR8/fQA2+/m9dQXh
         olzLl7IqtYLP9v+/TFzTt9QPDsGIqE6l7mEYcOG5eG3Ub1vdpX/up2tzH8aO0hs8nDp3
         jR81Nw2nf4omd/Nca8aeR7CiAi9XvR620WhesXPxvnQYWeFaU8PnawkUGy8jKXNpIxmP
         4qb01XNpmV4er5TuQwq3TCOpMvD6uhBWtYFyM7B5C1paTpOl77nYfu0h6ACycmS1doe+
         EFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfAxBP0KnDv/4EBL/oBo86bnfLRNINqbGzZ6mqebsQsuDJT3KC7IVaGmR/hAFUogNjc5i2LyO0WXGaog==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuWw7TqAShedoC50MHcYXWW3+tWlT3OYoowUt+O0QgGx4DddjQ
	YjRqVgjbA39Z4fS2Qs8C8rf+gVEcdqMg6pyHbxK8x7aXHAhz+Nuh
X-Google-Smtp-Source: AGHT+IEINX116vl4gIhEO+YETzlb+ZEQU0ZOmoguc1OJHWnXur7CYB6qLK517Onlg3HZrRiY5MLnfw==
X-Received: by 2002:a9d:7b54:0:b0:70f:7123:1f34 with SMTP id 46e09a7af769-71ab3216af2mr1408427a34.30.1732080974485;
        Tue, 19 Nov 2024 21:36:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4fd4:a79d:4d7b:917f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c3224asm8639311a12.29.2024.11.19.21.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 21:36:14 -0800 (PST)
Date: Tue, 19 Nov 2024 21:36:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 06/15] Input: sun4i-lradc-keys - don't include
 'pm_wakeup.h' directly
Message-ID: <Zz11SwzIYTgkgbty@google.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118072917.3853-7-wsa+renesas@sang-engineering.com>

On Mon, Nov 18, 2024 at 08:29:05AM +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

-- 
Dmitry
