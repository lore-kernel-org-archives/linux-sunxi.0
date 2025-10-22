Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0052E8882
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120109; cv=none; b=OJs6Pb+hM/XkcB+D8torl3U/we7yO0yI+3067VkTWVkLymxEIcwNollqAriossjilSz+1rVWwJKv7swi3y0mK9P/vP1JMrQNPoiLREabt+A0ARn9Uq4m9UKmlkZKTyL6vIPmmxTpU0e9jD+KPx5AEdy9I+y+6ct7Dq/BosD8yHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120109; c=relaxed/simple;
	bh=38r9xfZLwLJKROmeDdkyUpNf+YWWc4TDY/dD0X8glqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EsS3D+4ORP/OIjDmL6NUnL6PPJUt930ruotNcUP0+44UW8tB77nyX5rsjvIeH+6nyjNxZy/ggGiOS6E9x6uvqFomMo1Vl7m6VzWq/15rrTD5BhRrNEBt071V/lc8pygaJ33KyE9HDiDvgAkbhQrnPVd94HiDB6uqi1gjiUSRHKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HS+VOTVC; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HS+VOTVC"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso100833a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761120107; x=1761724907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Czcihnqa+RdFrhOYT/oFUcxYUUGz6vVNGz6e5p2QTY=;
        b=HS+VOTVC6ykcb8yV76NqpMZBDGknb/MXwfytrDhOxtXy/OccEJnEGDjK7UH1fAs5ZW
         MI96ovnKyDRpii2gATZHYFkdickAzDYk4FUlPT+muxYOao/IsS8eg7Mm3XIocDBGIE+4
         ifUH8x5v9wmc2P61dgVcl8toTaUyaDXvDEf9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120107; x=1761724907;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Czcihnqa+RdFrhOYT/oFUcxYUUGz6vVNGz6e5p2QTY=;
        b=Tizb9UKdhfnnhh9Zj/JK0AcwM4f9Jfch++mwLUXc75EzQSNNIcWjsZdEJJqUHOi9OE
         PfIyepGoNNb6a1NS9Rr845ZrtoZo2mppQvnbu49BBSHO4BRmjsbOVjw4z/TwqCtNebVu
         q+3eav7G5iCqDZdVXUXKak1R/go9IG5704EB/d63aTOVp0dVyt9/keWEjEAG6FndXTrY
         /ZHdk03H7yluBnHGDX/goqKgAslGe6qMJToRBCBgcnUDs76bxfQmVVvJaH2g9Dp1THBd
         9IL5nJH++Jy/wrt8YIHafT1GE/g1MlpFlBG590GulIjg8C3I5eqKDGTFV8E40UU2dp7R
         U7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvspYadU89F+Y95UB+7prkBWC7/Q4Nfohi0IMZzbk/bVm33Q/yS1O6fRLYUdnkQfX7TOcm1bZqII5RIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA47w5loYyGKvKG8sJYKl6noKhbyIjXY3o9+pvFIWdOBkpjlSy
	u1SJ1fR3v/SujOS0o/HIGQruLkdDnORXMIFVOlwjdKzyRZxRf/eA8aeO/mueZBHfoA==
X-Gm-Gg: ASbGncuasNh10KLbFUMlTboW0gi7YMLwpOrJiTMyfsT3K0+KmHRQiRFCdY08CZE6G8d
	hHlNb8KALpYUHaN9cH9Q11CaBuxyrLbBnLl26dVeI/T0sSZmwIIQOPXHbUEx/Q4Z22FUIBj00Pc
	LC/4aUk8zVngPdUDJVysDpd5RAs574IizR2s2Dkd+iQvkIEke4m9jJfHpYnVsOFLSdcENXDnfLy
	TJJIPK8cwiO2+wlYEuhZrBhHE01VgLIurkza0/T0pj2ToxEaPsk5WkE+6NdCmq8lVCCqVnOM7KV
	wRIUzHcGzAhzUKfmzwpwelPVtXC2iOXFDV5oCa3Tjizc3wPQj2h2Du98np31+OTKUaad1VffHU8
	zNvkkkH2fqVuvVouri7uZJJ5Big9M5C/elWiwlTpmeyvll+9YhHlpAsXvpOpxgz6GxUGX0b5txu
	kYKfdUZZqCgaCNtKuGGLULMAxbXeMw08tr+N+1/QxZCAIQpGCRmpBA
X-Google-Smtp-Source: AGHT+IEt15ezmGTqR4A8CJGFXTvCgrS4gO8P9rtkeOmGm46bHNcAFHWrZsKB4y1EeUubGMyQT47cig==
X-Received: by 2002:a17:90b:1dcb:b0:33b:b033:d7e5 with SMTP id 98e67ed59e1d1-33bcf9186f0mr29084769a91.35.1761120106936;
        Wed, 22 Oct 2025 01:01:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:5534:56e9:528e:f9b4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dfaacsm1771401a91.10.2025.10.22.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:01:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
X-Google-Original-From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
References: <20251020045603.2573544-1-wens@kernel.org>
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Message-Id: <176112010476.488381.11368848750305962943.b4-ty@kernel.org>
Date: Wed, 22 Oct 2025 16:01:44 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 20 Oct 2025 12:56:02 +0800, Chen-Yu Tsai wrote:
> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Update Chen-Yu's email address
      commit: caa2f6ee91d4e2dab39b30de34d2c74b6f45d0a3

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

