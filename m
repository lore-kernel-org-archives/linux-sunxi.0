Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5745C14D44D
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Aug 2024 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679286; cv=none; b=ox5tiNKMWx3lUbWEZA1jphBHjgLH8c00jUYPVEwfzWCMr4avuD1z5WTaJ1SI1gGYKK06eYudK2/U/IxKmUZhS/G7pV4FVHnqeRFoJu7xfCmrBm/TZFrfLvYGNNcvVTHQNatIAltVQ8hjggC2t1OUl190LWDei1ZWqYCo8+LaAsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679286; c=relaxed/simple;
	bh=1vNVZm3RuOHtSHsX35LnHADrFjU9GNLyHdfcBZtJHug=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Ckma37vcUwMvJzmihGNyI1U0OPCjiFMXRZcjX6yGcvnq7homLBjRTp0t3VIZW6d/YOLfZMXwKNrindyoqqcQULcAoh4tn1KQjccFzcYnDdNqvDClvYDDHQXxdyXz2CBwTnvryJetXcXSs63V4W7YL2lqPm+QxC/Mmq9tTjenaaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR2XZhwC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR2XZhwC"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5334fdabefbso3854213e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Aug 2024 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724679282; x=1725284082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhayvbickugtnI/gSdhlZbd6aElEpFdhIZRy3HzXNA8=;
        b=OR2XZhwC8xTGx29n5blAhXFyBZdZqeBXC6azgReeQ8MBEQ7DR+pknjpwyoFKxBIMsj
         fMu6RFniB0AeFHvG5761EyBhxs0ifUh6mN3qdJOn6vG/h149IqPZeQBOm2GGgBSzGlNe
         Hsw98mwK38OsE+PbDruYUeEUivldpcbKz3IH/LWDqocy4vTmfrP7bULptNqXePm4pBfq
         ZeZHgk1bQhgJGTyRDPi2AS/JF5YZ0vZ64/CzrKx3nJaO5v6GJXIRpnpVs8rLerSAfQ0D
         ySTk2qelz5uExZasqBE+kXbI2b0RNCciCuIZTeQAVHMwLMYoykbbhLHFwjxCEpHQcfKk
         XPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724679282; x=1725284082;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhayvbickugtnI/gSdhlZbd6aElEpFdhIZRy3HzXNA8=;
        b=EYokJhVcNPeB9KaxEhjqBpdtBkJx2fNPhhtOOJf+NqqubQFfT8XAjGPppZ+fRQvaiN
         I5l/+F892FB8vx27N0NMIVhtlyS4zNOfD8pjQeQSWvUcjboBA08rgfRIe9lT3fiAbecd
         iYt/ILKUzodP4wfJHxPK3G0wz42ReA7B5erv58f3N3/Ub1damP+gIeDJmfEgPAZtp2TD
         twIHR+rUYpv5df+OLfoFa0nRDBQJXsenTVDAxIACmw+KDdtZSpXDKLXGrzjZpF8qDyH+
         VCzlYIzd0OZa/tRC9jyC+WbRxhxevkxoaxgLp5oe1frkuxsxaWJiPkHJj4QoOrFW1eZ3
         AX7A==
X-Forwarded-Encrypted: i=1; AJvYcCU365llNB4khGrPzIDoZIqg97KZ2QZQMohyuUM9hqhhZhHbK6fgHHh/gb59PBRYKTlmPs0vqttJ9ac97w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0zqu39U4NuxEtYYmCWhD4AHSMVbvaar0GYk7WKeN7wcAgWjUP
	YNC+ipM3zrkD15D7ksT0L5HXBo8LJMf6TQnlasu1llMDKv9GHh7sAAnt/8th
X-Google-Smtp-Source: AGHT+IFARPPf33n6hTYxTuY4Jj7ZnZQLt9uAcMoT3c9criEuY/VXXzr60PV9cxN3DieunHsbPhSOhQ==
X-Received: by 2002:a05:6512:b15:b0:52e:fa08:f0f5 with SMTP id 2adb3069b0e04-5343841ca53mr3549521e87.13.1724679281864;
        Mon, 26 Aug 2024 06:34:41 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.86.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea59263sm1462328e87.146.2024.08.26.06.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 06:34:41 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] media: microchip-isc: Drop
 v4l2_subdev_link_validate() for video devices
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240826124106.3823-2-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <3bafe8a9-756a-40e9-a60c-e57e2d5e13d3@gmail.com>
Date: Mon, 26 Aug 2024 16:34:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240826124106.3823-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/26/24 3:41 PM, Laurent Pinchart wrote:

> The v4l2_subdev_link_validate() function is a helper designed to
> validate links whose sink is a subdev. When called on a link whose sink
> is a video device, it only prints a warning and returns. As the
> microchip-isc driver implements manual validate of the subdev to video
> device link, we can just dropp the v4l2_subdev_link_validate() to avoid

   s/dropp/drop/. :-)

> the warning.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
[...]

MBR, Sergey
