Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD682EAF1
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397382; cv=none; b=C/ciyI4kdV4EeqQcz9cuWFymMB1bT2KwTMHZ86CQnao6aET1zoEls5KH8JzuFPq0SSakIchaLLm13t4EGuIwxUV0Ujhpwf25AeHNi5x4uoCrauq85sB9oFlGNNREIAzbcYGk7G3H0zlg/B/ETT4bNo0/yxRG3KUxQfGWxWcmHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397382; c=relaxed/simple;
	bh=h+spn2EFfdiVd8hTXlKE8OlUtlr4ystVAw2guLf/6SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrq9lnPEE1TVxNqORq5Gkk1YEhIz4R9QzhOSKt/gX3lYUIMygphaB5bdWgf3vnutCE73mOGFy0+e1jryHMaXX9vGUYL088eu/1wblph3Mqhp+L/cKppbozNyEoGBqpz6BiLo956CD3mbz8uWFxexkpUVVC0Q7jXVCp9DEwEpFJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8NSdcWG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8NSdcWG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cdda5cfb6so35205475ad.3
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397380; x=1730002180; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1bGjd1n5rAZCn+evWllm1sc9D7H4aacdgC7A/pNYx8=;
        b=A8NSdcWGlM1VEEA9Q3c5a4PSPae6cKbFtNhUe9EopUh1PT+guyq0r4bbb74HHBf5Pf
         fvRESFFW7OQ6vH4r0wjBk6ZdCd0gvY9i/i1Dl8h7SLkb4FT0PhLDO8/2zwLsBsSDPGFj
         uhzNtyw+xHznDNZIMJpwzhu8owJLH/E0mgzyx0a7pKhf06rwVbW8JoaIRTro7nBelsah
         qkLl7lLx1pXZxKTu0y0o5Yo1dZ/AP344BPQXWi2fA3MEWCEjVGwG6AHrd0rgO+TwzPCq
         x32fb9LrAJzZ3o/UR8W9HHAjCutQtbI4MP1Uu3g/TzBpxQc4vLnhzM2o+gchakoimOHO
         gOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397380; x=1730002180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1bGjd1n5rAZCn+evWllm1sc9D7H4aacdgC7A/pNYx8=;
        b=BIQ8cxhHDZ0NgvZ/PIGJAGgfJsUz6/5SIdeoCHiOzPyGOpuoqhw40z8ZlLkW+27ckh
         Tisvk90OcC1vflsqrgzIwkjXzDMBybfyFMhICzoBB2jxxo7mOzKWuurgyVK9yIv7qznH
         BUY47P06iKyDX40PLDW55hunMC3lAaI2fgUuuYTuIsLF6Hk6te7u2aYZ4+ij+bN1lD+o
         vcmAzJdxE/hITn/R9xoSbT7524/fFRMMvJArKgY4Ad8uSEGUeUprp4kBA+YWTpHeR01Z
         lJhJTKBDyPRppuJ6KrtO+2pj+QvqenOeSNoFmMSuC5a3KaeW1JYU4pgsV2B9IMl/uNhp
         EC4w==
X-Forwarded-Encrypted: i=1; AJvYcCU3bEONPQH/sstl4xjGYgylNQzQnHuXFDZ1KkcDbARDFZ7B3pV+O3d40qFBSsOYj5Io06G3QWsu891X8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJXs43NJDYnJgl/pNPzlNXUqHHFDUzaltltQ32Skd3Bi+g1Wpv
	HArGV2lAnfdpEX53MYDlV1R5RMCR6gp0IVqYzqVlAryDpqd+lEctom9bgA==
X-Google-Smtp-Source: AGHT+IEc2BHyqmStnpq7KA9tIyD0eDdNvs8sr3XefsuIF66d/cAZosyCaPNYQ6F3nVDJeuBmr4bFWQ==
X-Received: by 2002:a17:903:2447:b0:20c:db77:a4f0 with SMTP id d9443c01a7336-20e5a8e124fmr91966465ad.25.1729397379839;
        Sat, 19 Oct 2024 21:09:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f355csm4248175ad.265.2024.10.19.21.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:09:39 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:09:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] Input: twl6040-vibra - use cleanup facility for
 device_node
Message-ID: <ZxSCgBd6th1i7B4X@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:54PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that the
> device node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry
