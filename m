Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21AD2FAD
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 13:00:08 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r11so698832edt.13
        for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=mime-version:content-transfer-encoding:cc:subject:from:to:date
         :message-id:in-reply-to;
        bh=/qN8xEQi3ma7OczhXRoGk29ArwNwt4NsItcOxhRz/50=;
        b=hGXKUN0rnT4AXodO5hn5rqoZnk/794xnaS1eUBWWaiAS7u4ss/khwiysrO2Oc8IgWV
         CnNb6LW9nkSpEizNsc3GWkKiHk6Yj9eAQVOEsZez0A1+ezIl+9rLZLu2Vj8KXFBOAYcU
         BG/+hcyrlpA8jinY56eV9Prl1mo6ChaHYVNkVacgVznNHTHfVEBp4rtZHTgm6RT5ocNi
         2CpZObCmUOjwrDddoyAg0ZC9ttdECVUBCKbQOlYdX6MHEBeX/GzTeir40yPmCa98SPbp
         e5iwgn6itb7+YeTkCwMLSl109Gh0Hvpocj3/TclpGSR/zjdpEVfNY2eboMDesRIpjhV6
         VIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:cc
         :subject:from:to:date:message-id:in-reply-to;
        bh=/qN8xEQi3ma7OczhXRoGk29ArwNwt4NsItcOxhRz/50=;
        b=G8ozOh3M1bRUdKOFrNtokFDjhVjTaCRgI89VDny/ZhjCgPoSGTU03FPJdYISDQ4teh
         hrbm5+A6mPdY7+rcIb7MN2mrbKc9qz/YYxAIVmh9gS5SRyDg3/JLXZFAspJprjWMyR3d
         KkNfTu/ycE693QiP7w0cEUYjH361T8QIUgfSHrpn6OMTtUQlrdcXfSqh4NxcgghggF5Y
         St/HMrL7iLHV75tU+RHiKN350GovuC3nJmEOZdjXsJXoJY0k1AzsUKUX5CEjDZUBJn7u
         Hd4xsjs5v33MAzCpVkIu+kwI32Vd+FqqZrODTD0KcBSwd1v21Uw9E9MNW0Xlbe3E62BI
         eqoQ==
X-Gm-Message-State: AOAM531PWkrJCm2P/q3aiJBN/UilqBs3+8MMjglw0xune9NvoDKMMrIg
	gKXtGI7NSRh0bRxSJOS4zB6+uA==
X-Google-Smtp-Source: ABdhPJyRfCR44IU2GP/xaHqMSY57isa6F9MiLF0YdDGQfjxjc6ZBx8XIz3e0llUitpYy/WJXxL8wCw==
X-Received: by 2002:a50:fb17:: with SMTP id d23mr3960725edq.338.1622120406960;
        Thu, 27 May 2021 06:00:06 -0700 (PDT)
Received: from localhost (ip-89-103-215-157.net.upcbroadband.cz. [89.103.215.157])
        by smtp.gmail.com with ESMTPSA id b15sm1051503ede.66.2021.05.27.06.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 06:00:06 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@siol.net>,
 <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-sunxi@googlegroups.com>, "Roman
 Beranek" <roman.beranek@prusa3d.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] pwm: sun4i: Avoid waiting until the next period
From: "Roman Beranek" <roman.beranek@prusa3d.cz>
To: "Thierry Reding" <thierry.reding@gmail.com>, "Emil Lenngren"
 <emil.lenngren@gmail.com>
Date: Thu, 27 May 2021 14:10:35 +0200
Message-Id: <CBO0N2KNI5MJ.1KDTI8B2UE4SM@zen.local>
In-Reply-To: <YK0onNy2r30aNw2g@orome.fritz.box>

Hello Thierry,

On Tue May 25, 2021 at 6:41 PM CEST, Thierry Reding wrote:
> I'm pretty sure Alexandre at the time reported that the instantiation of
> the controller that he was using required waiting for the period to
> complete before the output went to the disabled state. It's possible
> that this was changed in subsequent versions of the IP, so perhaps we
> need to distinguish based on compatible string?

I've got myself an A10 (sun4i) board to test my new patchset with and
indeed the 2 cycles seem to be enough.

I have yet to write a cover letter for it though, expect it by Monday
at the latest.

Best regards,
Roman
