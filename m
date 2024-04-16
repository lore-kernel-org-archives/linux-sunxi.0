Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDE22095
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242492; cv=none; b=V8HQE6R2ecKyfNOs0/GrkZXPRilWb6MiOCZVTJewtVnTJ1/28GE7OCcSmxMtEnywBebqQmtD2g+FdMjWIxXY2s4sfbNwAX8g8KTsdLySTNH2eBpNaNjb3edxb4e/KJ5cVKFNl/4QA9Fp2N5JpHZoiBTag44YkS4PIlzDlHH0Eok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242492; c=relaxed/simple;
	bh=DqDyd4MpI+rvYMYAT3Ft5xs95IMJydJhHOHuJjyBxW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AncsJMzvtcf3WsNMtMMShuRYyjum8rNP8b5fJMnrQZUN1JHvnrHdNVQuhVH9+5waU0eySKI7esZObPsptpWw7o6przhXom+MDDx+xYtYXlrPFM2/64s+Uzgp1/Ic/lymuzRemdxxDq6pFDLZ/rDk9IU+SOCN6vU27HaVR0nUQHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TO+r8e8S; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TO+r8e8S"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-23408962585so2028082fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713242490; x=1713847290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=TO+r8e8SWl8HQxH6nfYFdOaj8oSTdhrAtFkwWiXguvPZUvNglUc8hAqd0k79Ovjy2b
         Epps0CiuKrTk2zbfmoSTSw7sSk5HTjGsgLVKN7kfgRk/yhoNx0CKaSlKbGKA2lPI7Irn
         jWu2LSI46W28KjhGtV9S7o22Hb13JD5ReSChY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242490; x=1713847290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=ETV1JN87oiHxeSYlV9MfqnNp2cpaIelNwXK5uxNq7q4UXdVqoeGIcaIKTgfd0QKbNV
         pLf2Y8Bmo3ZVmJpUpNtwKRKFE7XD29cgh9asrB0+GyqIu2EcG1yrD79kWqgtHqHpRmAt
         wisC5CkZuaHgdbjKMJGadOjgPSo0B6w5pYY/N+hG+4HCSoO1XTDr/1X3eHQnnOXTKbuX
         7cLN/7+ErV6DV3Cgp3hleU8mFaK6n7ofN39dwR11WZ7Bfyh79MNInDx6Sfv4ihlQNedw
         fjTE3ogVd2PmyVWT/aCGD1+6Boayx23Xz8bF5Q130yLLcKu/LFo/Za2+8L3ImicAeJzR
         lefA==
X-Forwarded-Encrypted: i=1; AJvYcCXKl1UvpOKapEmuCGvY3ylxab1Sf2zCwAJ8f6/pfv/yYWpMy/84btDbd4axyCaia3n1qWzOaUTKFHbV2sevFB0I+w7DktuCvyvTFes=
X-Gm-Message-State: AOJu0Ywv+THbcVf9MWBFaZIpaDJvSRh5XCFQ+b1bXRX6WkAZS/BFJAky
	8T9TPjcqY/LPNdaGXrotkuAiVHMg4AdaJh+21qzui91VzFgGaRCqAK6CfT5IMQ==
X-Google-Smtp-Source: AGHT+IFGNPBipDIE0AiNQc/Cqlxd5431Vef5ObfevA6hF44fnzurKBxD1B4lS2oVTJREu9b1YFAdCg==
X-Received: by 2002:a05:6870:89a4:b0:22d:fcf9:bd97 with SMTP id f36-20020a05687089a400b0022dfcf9bd97mr15408827oaq.26.1713242490147;
        Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id r4-20020a056a00216400b006edd05e3751sm8284703pff.176.2024.04.15.21.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:41:29 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:41:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 04/35] media: uvcvideo: Use max() macro
Message-ID: <20240416044119.GB14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>

On (24/04/15 19:34), Ricardo Ribalda wrote:
> It makes the code slightly more clear and makes cocci incredibly happy:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
