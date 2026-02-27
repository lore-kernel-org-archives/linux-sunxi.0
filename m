Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761725A62E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181507; cv=none; b=cAWs4Psev+CDc9hb1TgxQ0wdIkj0jNIhEqNL/OvRTRtGtGOsEi+DPRxhfulbK8ZvOxZa9THzpmK34z2cpfa7jZpnaKtnvadcXEiKJCSESjjE/qEHbSQFPdVx8cdf0PrX1F7qIdo5gXE/nGhwrIHXvRykZHR1Z1RZWx3nnWsXewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181507; c=relaxed/simple;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6VY5N6FjfUT0JXoz74CF3ULjwHQ7q78cDcNF4f/FYROPKNpnPLO2jKkVDhRlQ67FFR/5ZVItNg/ID7nlKWk44D/E/xUuvtocqMfAssfrt9v0/nUXwu2dpPOqxtHj9zuaYe1k2SRh55XRLj3LGUqUWlEeEQYaxeDiMrqi0YFo78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYkyN9p4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYkyN9p4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB298C2BCB0
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181506;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=cYkyN9p4l3IIvdvrqRAb+vYflh3b8kxbpkvNhTVamzcgmREpLnJKmyS1mP7lDqPzP
	 tUjwFH91kS3egLvLNISUREftTcEjyj0n317ZAyIrWX9RquV8k5a4/Sq01G/jg1JeH/
	 U+SoBDcXVhwy5zGl/m8BG45mubKKM/JeGN/R0H9uGl9N0z1CE0KfdxhchKBJ7HX9hQ
	 g5MT4ebowO6X04dWNx4Axdll/eq0e+bs8hjDUw9SViYBpjbaGnX1EqqDc2AscqdIc+
	 HSr7me9mmxfJyliyraD24N+AEGz/SeLCCux9PyXR/Mia2kcdkAPGtKXicXtIOuD14r
	 3H7jtehDoe34w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3870902760cso18848521fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 00:38:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9G49+BpbryqKbG3ZotwjyY7f5R5U4lOO5ZKAEDbgBJ0rHGpB2CopZZX5yQjZnSZjuo0cq19TTF9oG6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHBym1Lrtwdw5jroCFD05AdU03hDnEdPSr8BohMp/yVfh+vLuN
	O922Nj5DVexxt4p34j53ynFSCfIv70PWPQTLd1FN6MWFVouFfL/NGiCjCQJ/pIIOncxJOPAi6gD
	AG4nzD6Cawi/DHgfGUKK8Mq0FwAuqMRbuUwCOXFz89Q==
X-Received: by 2002:a2e:a10b:0:b0:389:ef35:fb9e with SMTP id
 38308e7fff4ca-389ff15f2f5mr11325631fa.24.1772181505403; Fri, 27 Feb 2026
 00:38:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aaCrT1SvMCIKQDmc@ninjato>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com> <aaCrT1SvMCIKQDmc@ninjato>
Date: Fri, 27 Feb 2026 00:38:23 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
X-Gm-Features: AaiRm52Yb9kd_att7B9hKBtSpFgOcTtzo7FDwU7A01PqlXP6UIrlHqDUHcGb-x8
Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-media@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Feb 2026 21:21:35 +0100, Wolfram Sang
<wsa+renesas@sang-engineering.com> said:
> On Mon, Feb 23, 2026 at 09:59:29AM +0100, Bartosz Golaszewski wrote:
>> It's been another year of discussing the object life-time problems at
>> conferences. I2C is one of the offenders and its problems are more
>> complex than those of some other subsystems. It seems the revocable[1]
>> API may make its way into the kernel this year but even with it in
>> place, I2C won't be able to use it as there's currently nothing to
>> *revoke*. The struct device is embedded within the i2c_adapter struct
>> whose lifetime is tied to the provider device being bound to its driver.
>>
>> Fixing this won't be fast and easy but nothing's going to happen if we
>> don't start chipping away at it. The ultimate goal in order to be able
>> to use an SRCU-based solution (revocable or otherwise) is to convert the
>> embedded struct device in struct i2c_adapter into an __rcu pointer that
>> can be *revoked*. To that end we need to hide all dereferences of
>> adap->dev in drivers.
>>
>> This series addresses the usage of adap->dev in device printk() helpers
>> (dev_err() et al). It introduces a set of i2c-specific helpers and
>> starts using them across bus drivers. For now just 12 patches but I'll
>> keep on doing it if these get accepted. Once these get upstream for
>> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
>> drivers/i2c/.
>
> I applied the series to for-current but squashed the user conversions
> into patch 1. Changes are trivial enough and I don't want the pull
> request to look excessive, so it can go in smoothly. Hope you are fine
> with it.
>

Sure, do you still want me to send these changes in separate patches for
review?

Bart
