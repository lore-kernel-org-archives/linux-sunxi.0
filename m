Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F7E1096F
	for <linux-sunxi@lists.linux.dev>; Sun, 31 Aug 2025 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756647999; cv=none; b=lxCHFVo30lDabQm6vcnIOKQjElgCj2YHx+Ov9992Urud01A+ZR2AZAnIrscFScTrUUbdJA7vReIatw++QorFtHbiVhj2P8JOD1qhbGyrvt55TPq6kIbahYNGMqVTTeQLLJZR6zgjO+2ktlZnMW+phagP0kHVshHCc6gp/ra7dNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756647999; c=relaxed/simple;
	bh=0d5wm8C4Q5yjpa9NOEPusF9Ma+0IGpCMou/z5myvIx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOpTn5TdHZJlNJPj0yQC34+hEJ8poGJUxSQRdL6PXjEjrz689cIjZeByrV1JOf+mESQoVm75zhZODZIowqdi+yHNmwkwVBDci70IOyWfDqV+PRT8bzTpXfBgyZSr5xwF8JdRjB1ndrLViIc3mqZ7oNziNKsI09xM1fJFq9WzXF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=X/X+U9oV; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="X/X+U9oV"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7f722cb35fdso318078985a.3
        for <linux-sunxi@lists.linux.dev>; Sun, 31 Aug 2025 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756647996; x=1757252796; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
        b=X/X+U9oVKCMrWO6+2Z9Wn/wZjLA0uameuMG8usDL3F9aFBd+N6DQ2RnYl7jeYuGmcW
         OsKi+1MzZ7EgWqCHZnrgbxOXWsL4WkF8/Pu85DVzIeezQLJ4bFH36sSxQelvoAPYdGTp
         n/4KYOgRshqUhCqsNOMSdztmTDa1TYVIzmUwkSggMaz5LuWDMmKFUYMTEh48SXW0uQQ2
         3FbnbjvOsWzRuNN5sKnQMcom11Dg/MaxYqSPtIB6xy10eoTbmXmJ+rjdP4pu7KAZQi1U
         NpmoKhJJL2gmaUDSdjPS+6s1pDyFPFjlwIwaW29Ku7HqNWTeFn6v2ayeXNESJ/m1wHI8
         Aj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756647996; x=1757252796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
        b=fT0ECE/T+BDUKnaHr5XX/KlGcT3NmQ5b3niEJkySA5uu9IiK3TbvcFFWsK9bbzp7OK
         T5KGSAkilVX6BvAF4VYtqDG879H+IQjMigstHr49s/N2HcMvcev+K6LgaCP9xtIuU4KS
         aNku6ulwNBP1AZLrIV8diFGjMOxq8QUL932bpY4VHIMk1A1UYKoNta68w4YtEFfmWr4W
         cqmTexrMqFuakxrTazEjEw28f3uA6mvN0BHo1kfpJW9dfVrQCjKJ8c40cpqXCKEQIONg
         nM/1XGdPC0sbGoM2Sy5W9XvW1vNmaFtnJ5yeBcFxOmue89M7rcXHiPasO6BtEGwD/jrj
         fQFw==
X-Forwarded-Encrypted: i=1; AJvYcCVB3Rl+5oBtX4X2tTmhR/8yVLplhOkUL0DtwW3dnuLyeIZXNf3iO/RBRDkow3+4752XvewLbFMqFK2qWA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxue7tbQ8sAh0sTBNEzZ5HJ5wSUqysobwl4DQ4TLfGnMQJ6d9O
	7tlYhMrjGijUiAPrs+QGxaGrjdrBpfq9q/6yXE1NnTKqWQ5pBxqOM99AGZyW7ba8CM8cEsLc+00
	bmbnJbYpD/EysB/FMxUDhVEdYyEEw3FHrbZR0jEl2sA==
X-Gm-Gg: ASbGncsL+q9SH1PMoNEXZkqaA3rKhURIL1TnX1mQA/JisznZ5hODYJTCz8UK6rtB42/
	QSm0ZZPcsvTAv/ijErgA8c9vZeAIYNQau4srzxtN2R2bTBLWE1tJRCHbXC5hoxJ5NvjH/w6NTpZ
	tqQWuj7JU1YV7mhRbt7CPvnlsWUD4CkaWL76f2GAmWA79Fd1hw7c/JyTflKGIbJ6D8XAN92+/cG
	NgZdQ==
X-Google-Smtp-Source: AGHT+IF0dh6mtaD+ci0SXGWWOl3LWwfmYnKKOgfGlK7FZ7iXiuG8d9Mqq2iCDHrHKRWGSRl6Gppx/kRr2i15hBvQ/kA=
X-Received: by 2002:a05:620a:c43:b0:7f7:c2a3:eaa5 with SMTP id
 af79cd13be357-7ff2b9817c6mr503403385a.68.1756647996439; Sun, 31 Aug 2025
 06:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com> <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
In-Reply-To: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 31 Aug 2025 15:46:25 +0200
X-Gm-Features: Ac12FXyJd7t7ZABF85TqQwXSEhwFfQP0deD84tmrq8IHkkpEGuVOeuzNQcUs-Sw
Message-ID: <CAPj87rOSb90S_TeA8Cu5kd-M8bbfiE0fvPzgr9Gr4e9_rfZeFQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Liu Ying <victor.liu@nxp.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Sun, 31 Aug 2025 at 00:29, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > packing it into the two GHDMI banks. So the supported set there is
> > 'all of the currently well-known ones, plus any two others, but only
> > two and not more'. I wonder if that has any effect on the interface
> > you were thinking about for userspace?
>
> I was mostly concerned with the existing debugfs interface (as it is
> also used e.g. for edid-decode, etc).
>
> It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> HDMI also have those. I don't have at hand the proper datasheet for
> LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> generic).  Maybe we should change debugfs integration to register the
> file when the frame is being enabled and removing it when it gets unset.

Oh right, that's really interesting.

> Then in the long run we can add 'slots' and allocate some of the frames
> to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> salvaged as another generic one)). MSM HDMI would get 'software AVI',
> 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> want to use). Then the framework might be able to prioritize whether to
> use generic slots for important data (as DRM HDR, HDMI) or less important
> (SPD).

Yeah, that sounds good! I wonder if we want to surface that from the
debugfs interface: maybe just files named 0..$numslots with the
content of the infoframes, one named 'slots' with the integer index,
which infoframe type it's currently carrying, and which types it's
capable of carrying. Then to preserve the current interface, symlinks
from the infoframe type name to the slot index.

Cheers,
Daniel
