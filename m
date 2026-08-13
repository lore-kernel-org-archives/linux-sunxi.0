Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF4F47CC67
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633767; cv=pass; b=PAvMssqB9zYROMyrFAuqsZmQoJpRsSUPt9kj6OJ9ezFyfxV7FORbZ1uzyk+Bi+hRHGc2Rdvys/Yf6eTLIdTObVdiizv3T0bgzy+/FtD9aT5YtSzmBXjA2u1pUEvE6UveMbH456ikFQrrGrNBYV5F4Y/u5d3asasXfzrl0Ll/xDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633767; c=relaxed/simple;
	bh=a6lWRcD6CaA+CwQaMi+DHM+EcYAwTleE4iBxlL2yHZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+HjbH9A7UI75g6DO9ZuMSe9a4AI/KreW32Ok3ueiJFWVd8q0B+socfOMVLnVGR6MfSN/MtxZuXMCYlfOzMvtbTabnt49IGhMnmPh/OWU3DWy+46Ot+9unWpxZJ7v9AVcuMDXBnkmNoxk+bfVbMAYoacDlqP9Ne4ZDKt9CLYN3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=HCXEJEKU; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="HCXEJEKU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfff5f88dbso111925ad.3
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 08:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786633765; cv=none;
        d=google.com; s=arc-20260327;
        b=LmhwFcBug7PX78S5V4KME+2cAcbmlZguXQpCDXocRtXN0thHgQeGiNllrgjRwkzLCc
         zJn2sW1pIUQpUwJ/bOcD6KOpS9EQtisuUW/r0DAy7EigPrpigo1gpNAlncFVPgFgaHAY
         ALcfFD0lm7c/rBTsSc9IlOAJ9g9/KpMvKIdOmerWC9rwB8IHHkYLTfWqAXuUqYaBAzlC
         XVW72XuLGSzu12tN60L/IZ2IVBuMMK29GNmFM4PGCnPJkIgtytbCTqxFthljJdJK0fqS
         wB8Oy/k9AaxQw5MnShgvQ0t98LDLFgQBBy1wbVO+ogIq2MSTbNdhCotqMr/IH7U60YKe
         JOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sSfixZQMz0vR8g6mx6GBHkzMd5TjHfFJ5VTa4zkEMgM=;
        fh=m2ml9eVOiuUWKERTzZnAUG5fo1GSIZfyhW/Z4Nu1Fgs=;
        b=UwG0HJ4624hL5oqwcoElzmVjL0FZuuk4aMSx27tolgwlzbdfiUZAW751Samio7RZRZ
         ZJLVr2jfsuKbUu626GTr/Tm/6yj61hebtmCcZYUcxxTCOlVfeEhBC99mnAnstDo07P2N
         yXG8H6rWwUkBzZpGc+D6p5XJhWhRTrdfJaD5XYd7/8N8ok21xatWhkVv4ATxBtTQWU7L
         ZfvP+w1Wv6bLZhNm2XxDVE4ZjKDN+tBNRngqVRgbmtfgQlacjARdXu5TdRW6g85Hp2oR
         CnSSzgG6tjsDOaYfU1wNCV0QWNTRtFpg3cVclZM4F///AfHYFS0SopYtoMKG6Vg8By07
         iKEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1786633765; x=1787238565; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSfixZQMz0vR8g6mx6GBHkzMd5TjHfFJ5VTa4zkEMgM=;
        b=HCXEJEKU3ilNCsFzon60+lrSUTfsW8hlDqSJPx0sZnImNn/W3WDY3ExsNujX2qzIsG
         nJC1tpEJTFZ1OkUyU6+/iRfiyWstwZnhkzmMt60vy7JaDUkvyNZk1zu/DqlmE1ecp8JM
         W7IXTZI8ahaKUoiEogg5WJFY4dZkfW8xADK/r5ZfdhRbRqAw4uU0qwmsmY4s67RWva9m
         M6Y96zF1nu8vIgvDPzNR3mbXam/CG+fccl+JaT9oBr4R4OJaCjrpLZsZp30hY5m4I0U8
         fud29F9ORXTHvdXACkpVPS9L0liUh3Ihy2yPFFsc9WEiWrpYcZaX5HSu5uZnBgE5uVY7
         RFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633765; x=1787238565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sSfixZQMz0vR8g6mx6GBHkzMd5TjHfFJ5VTa4zkEMgM=;
        b=QCgvMmw2RV5wBMVybnXQZuQM1ev637d7nxrd2CPndh1qNeZzAj9Btmn0U16h96V+i3
         HEzsXNeL1zRC71svqpGk8d75ubI7YQphdMAMky8Gxvec8TLXGMow2raFmTxreXEHNxwN
         wcmctn/qUbw9AyDCJL4bkn+vl+CsTcOnnUEZXzTOLOt5jL8FwVzrpyor/Y2rTubv7qC0
         PUcReA65ZIYBr5gP3+a1AVuEsI/2zTWlPyiOSTZ6zjbuMmJcNOeUIlQ/EZoxWX4VdF+O
         CXZWKUIbcbV3uYiQlBhwTA85oC7IE0oZBikboBl+na/4BIuzCbYVDHyy3k4CxP7YoKBg
         FXlA==
X-Forwarded-Encrypted: i=1; AHgh+RrJMgEYg3adL4IBttnzWcWp+F/x8F6P0tnkaEYeuMQNMrJvfyuZrg9tsrja8+hdfA//QvhQZ/5mIpMaWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQUO7wzBn8t70872xmc8yMLM4cieI51w60au6AaMc04U/JMz8v
	Eg40r7kG+d3zHddfTSPJSIMdwfxEF0yiE9c4N++WQGo3+PPcpIJXKTjHbRzEp/yNn2WyWsC9CbW
	L0C9LycPYMMHUf8V/hXxbngC+3e+Lbsw5B7zz7U6Bdw==
X-Gm-Gg: AR+sD13I04iUNs0hQaz9KthScbbd6e06TJOR9u5I5VVvxkFTxAu//g4wrTkGUW5t0kW
	JuBNFfMHu2JE4bb3pZzLYs4yILpmyEOBmM37v4hMCrWVu4eP/YiUVl1WSubK4TuO+slXeBP1aNI
	P2pSHJnyo3TvcknD06KogtQZ0UNRo0ffsYKPyQHTmwtIMML7D8HcPm87+WAdXHkCVWuyfLipKMT
	/21sm0ZwIo56aSbWPH+ZiyEBj7nGADjfvMBpqqJS0sOZi3qzq0zdXnOdcmaJXSuSdNOMkh22uwG
	BEIkgl2OYMwKC4xP+A0q4iKB4Pp/gVUQocCVWIQpqdgI
X-Received: by 2002:a17:903:2987:b0:2ca:619f:9733 with SMTP id
 d9443c01a7336-2d37e9ae9a8mr80628175ad.17.1786633765124; Thu, 13 Aug 2026
 08:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
In-Reply-To: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Aug 2026 16:09:12 +0100
X-Gm-Features: AUfX_mwnT8mSX1TxP1zLMIDeonWHO5mTijXRqqeOSADs0LdjYAmb4n0gllJsz2E
Message-ID: <CAPj87rMNdbzebt0ovJcymRtBNunnQaVx_=aSUbcrXNTEZOPz9g@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Add SCDC information to connector debugfs
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

On Fri, 24 Jul 2026 at 15:23, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> HDMI uses the DDC I2C bus for communicating various bits of link status
> out of band with the actual HDMI video signal. This information can be
> useful for debugging issues like questionable cables sabotaged by feline
> teeth, Enthusiast Grade cables made of cow fencing wire, and other such
> problems that ruin one's media viewing plans.
>
> Consequently, this series exposes various bits of pertinent information
> from the SCDC protocol in an HDMI connector's debugfs. To continually
> poll the link status, userspace can poll the debugfs file.

Pushed now; thanks everyone for review and testing.

To ssh://ssh.gitlab.freedesktop.org/drm/misc/kernel.git
   0d46312808f32..9b388fc3d0e63  drm-misc-next -> drm-misc-next

Cheers,
Daniel
