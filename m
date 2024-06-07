Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB2FD2EE
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Jun 2024 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717787863; cv=none; b=RUttVNr3SjgPmRhgVBegoZB4LiF+W4Y2CS1FOf/+TPikyGSDQBkF4ptXPzq+hAcK+hQSCqHUXLxGhfQ9Niu9/qgIBUcAn3j5Tr1VsDczLNVODAal87H5mcuLnGCMnGxXbOvrNSpulfeNtJYzhkdJkGYh6xW4s0Aoc+oqM23pmrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717787863; c=relaxed/simple;
	bh=d7pNxXN7ZZ7n1TjEK8X8kD9o37/7SEp9NufTqHRsRe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJvqHqEu6cwzayT70j7uZGGrqEFZdvWXjPSmed2rAXb73TmwDX25dmKIUg975oFn66+uGMX9+xn0s73MhSiUn1hik4qxiDxK/Hr3OgoFF58I7mB1F+ri42VPVK8PKpjBMX2LEi+Q9WH77jUhemXaoD7Ameh32mZAv744dsdywhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxQJS4aD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxQJS4aD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7041ed475acso331967b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Jun 2024 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717787862; x=1718392662; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMwKu+pMCkNLk3fA7XHYBTAbLNx7GuEVog7Bj2JBALk=;
        b=QxQJS4aDB/A7r61Nf7KmCo0ZgEwTGNkSAhNMBVnASUsETnLSvo4jDQM1PL7aFwlIBq
         BfZJTymsO8W3xZW/fkIOVmb1H/XDoNYRR2jR6/IUUgoNMnSqoNlMCKCnvxhsn7JyPP1y
         Uin8pg6p2GIqbTRNGbkrdFSCbxIOPjDCYEP9bg/ABFuhMboWfaLzzRoNdYavLRJJAubG
         9DJffAjwGJ0N/cszNcI+bRgMLQmI6JTs42AChuLqyxl9HV11fIo2q967oE9Y7PNu++Ly
         PJ198Pg8UPYx9dAVFv98FESsK2QzHmlA3aMrbK7qjTzslT/t1x6GZHs5V2RN8j0Fz/AM
         MlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717787862; x=1718392662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMwKu+pMCkNLk3fA7XHYBTAbLNx7GuEVog7Bj2JBALk=;
        b=K1Nv9Bp6fzDKxK6jN1PWgTJo8HXmzjSXZBU8n8me9KCOjZm7/MawRPxzlqcecR+646
         L/WVaRYn1C4WUfslzRIqvB9Cdo76PKZvSBuoI4GEKG14o+P4+fbbFxZF+Y3M8hqzFXMR
         3b4g/rLfO+cQPkfp3lUHyI9bZ3KShKFGLTE5E4mKRXt0HgHW1S1rXA5AieVqYCgnaMBc
         8VwRPvEwhCjOqotcW4zsGCu3u3jBsttJMYy8NddRCxAT04+mRvtuqVZ3/pXtdRt/tobN
         WrXvQ1WtnY6uGUHMww3nkqD/9XBYxpB9Meu+55xSYR6CDqhnutSmBfoH05xzA6jPC+PD
         lmsw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9mWFm0v+B2M2mf4NJUdKHEBLwrvpoi8zB/Ux6J1AeLL7OIq9wT6Sh4Zi4CS2/UNuzKTW4j7M5gRdYIRIstXpr4EINhg7489vapc=
X-Gm-Message-State: AOJu0YwdmRJkFGbPNwrEVZbW7u5Y3LlbTUsSBdcJgOKtjPsxSRB+yKa3
	LtiqPo2OuxO6Nkhix5Mor0o1AApFxCQWiUGd6L+6DeQYCeYWbHm1WyyMwA==
X-Google-Smtp-Source: AGHT+IHYSV0KCIG3qxQOTEBKKcc1mjWK4+6fwEeVHg+i4ItkqLKlvKzlGZXukzqLa21WlkEglyJVUg==
X-Received: by 2002:a05:6a20:918f:b0:1af:cf63:3742 with SMTP id adf61e73a8af0-1b2f9cb14e6mr3810470637.42.1717787861751;
        Fri, 07 Jun 2024 12:17:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8e9:3447:a54a:310b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de200848bfsm2600379a12.1.2024.06.07.12.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 12:17:41 -0700 (PDT)
Date: Fri, 7 Jun 2024 12:17:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Russell King <linux@armlinux.org.uk>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Chandler Paul <thatslyude@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Ruan Jinjie <ruanjinjie@huawei.com>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: serio - use sizeof(*pointer) instead of
 sizeof(type)
Message-ID: <ZmNc0cwc6yzl3_7H@google.com>
References: <AS8PR02MB7237D3D898CCC9C50C18DE078BFB2@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237D3D898CCC9C50C18DE078BFB2@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Fri, Jun 07, 2024 at 07:04:23PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter). This patch has no effect
> on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry
