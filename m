Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE32C1F9428
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jan 2025 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736481390; cv=none; b=ArgHCR6NT82pl69Hqr8l9fH3qvI1ZmvEeWwJ/zVhivs/dF5HO8JDTcNnLcr/Qs4zogyDSize3YsqKafaKDivtIR/HiocBrikc9mkyDJ6v1YNZKIKoWW8fuAvSJxX08COigRAQChnobohX5sgQskLIvFskT6TKhX+lEdOzaq22/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736481390; c=relaxed/simple;
	bh=egLtB4HLGdZ8+oco+9+ID2uoTuwSzhJS4XgyxGLRmGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJ8cLBJP2G4F8kJt/0Ajn4QE1fQknvdYbpUhmeS0B9Sr+lzyhMdRvHrjhFUplQjrY9IiCQAsqzb35CbaPg1yI21O6s2juoNY5ediUbnyPKWFVwZ0jIMw4nc0OWPBpVjXpFdT5vspK7IJ3B6WZysN3TagoNoiOIsT+f1cFs0tM7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBBEZBHs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBBEZBHs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21a1e6fd923so35447015ad.1
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Jan 2025 19:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736481387; x=1737086187; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RR70wLeoCQ1eXpWC969kci7NhDWn4+pUF9Yw82krK6o=;
        b=CBBEZBHs0Fdd9meiQD/+V0zsWegks6/wiWEFs2vKE9+rcZYq4BTfoJC8OTjOFaP6Lz
         l4I0tW3DGwkwtNPB31Us1+B6rVYxa/oqOXTIHOCmLpB22YIIghW9Tu7k4KZwzDH0Z/QB
         tm2I0k8aHexCQt6gUGIYzVyAncADpNb7jtWKllQLnNvhwddgOzKb28SeuXdM03rrL5zt
         py1SEkdSDb/cNhpzt9J+qZipF2bjyW7UWihSNUI/lH20wRe83CKR8XAQ3Z/7pzKDApec
         LhUsTb7u7LFo//seE37hC0HtoRb+CIObEJifJiRRAHeQgkrtb3d4OM3KMmM1Z4yn6yvZ
         KsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736481387; x=1737086187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR70wLeoCQ1eXpWC969kci7NhDWn4+pUF9Yw82krK6o=;
        b=YDtzDrwLN/z0F3xHYYEU2uCiz9PvrvEIZ4zc7tPQOJWVl920HX2PCXbcokyt5VyEct
         JijcjaIW9dflhn5Rx2BzWibyrPkFRuuBSbOXjnt0DtKdMeMLsPHZb5chiyF9y8PxTpXN
         CJLwpLO4r+7WrSmX995clnEBnPtiLQkZjzmvzFJpnSEVr/59X6+XynNyZfoZKCc7fbt/
         8aNEUgLd/pr8qftzXdUZ3Yc9fYsS4G7KUS9h+0vLNULilD49ldtkSsuk1h+hhE9vYAZC
         ifUFWQd+0RlJmM3vkiXgKsnqJ3+U8Rti9zGZylOcNwXWHAmpb4+bh/liROvONEHGdazi
         og3w==
X-Forwarded-Encrypted: i=1; AJvYcCUTWUp/OJ7Z0XDyPIL0DnzqFOqlXBXbTBLfjCAFlxTLg2HZBlrQlPuuyInzpB0NhfvApW0JAn3TCyUJug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9LF/wybrkN9AVOwHherpuPiFmY3yr4N3YIwoz45ifLm7oeKWw
	/9wbKjMpU96b7CveuMDJCbVaNwE1hYtG9FkgmPJySwrq7I2pE+aCE0vKxQzKe2s=
X-Gm-Gg: ASbGncvJIl/th4W2HUPFb38mwyKwd0VilBAVcwp3bOxKg7XfSZk0b8RYb8ROhTz+UyG
	S+HvJroCCpOS9qiqpCXT9hlITFd4bhLudX7cTrsY1JlRnvzPZYLpjktwDhfR5c4ZrD9okmBvI61
	DQtAkJkLFvgxeR/ptWmOAhRd5a0z8ugJb5ElDywDEhMCOZ/jacgbe8ohx2A4JDsNo466c2IQb+Y
	FgHyQ9skgrGWqtyIjjY/wW896CIn4eVW2xYA0atQocyfRIe10goLUx3G5A=
X-Google-Smtp-Source: AGHT+IEunIAD9f4eEA0vglmkpTO9Q4e7DF1K+CQ6YgG884ITThUtecdS0LjbKH//YuZcwL4Fb/98ug==
X-Received: by 2002:a05:6a00:1ca1:b0:72a:8b8f:a0f1 with SMTP id d2e1a72fcca58-72d21fd29eemr14066244b3a.20.1736481387167;
        Thu, 09 Jan 2025 19:56:27 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549408sm603419b3a.23.2025.01.09.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 19:56:26 -0800 (PST)
Date: Fri, 10 Jan 2025 09:26:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Cody Eksal <masterr3c0rd@epochal.quest>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20250110035624.wm52tnag3lneuwtz@vireshk-i7>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
 <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
 <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
 <20241111055504.2f3szrd5ahudvtqm@vireshk-i7>
 <CAL_JsqJJ5A+nYKg1aU5zqGZsmtNJxpS3Gw04pSH-3xOkQ9Vzew@mail.gmail.com>
 <20250109225312.GA434678-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109225312.GA434678-robh@kernel.org>

On 09-01-25, 16:53, Rob Herring wrote:
> > You missed the binding patch, so
> > "allwinner,sun50i-a100-operating-points" is undocumented. Can you pick
> > that up please.
> 
> Still not applied, so I applied it.

Somehow missed your previous email. Sorry about that.

-- 
viresh
