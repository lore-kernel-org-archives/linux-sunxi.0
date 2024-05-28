Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DFC8BE8
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858107; cv=none; b=VaDWRMXyF2uEpo3y+KgT0QEIfOtoSz7wURBra/T6pM6Hv3hH+l4e2INJj+Bhhkv027aIbJfHTYw+EUMeY9aCbHiTdPwHCPi3n5tmI/HyyxMi62SCQjXd+9x/xMS70O2IeYX91BszE8Ol/M7jNejihg7X6FMy3K966xd6AaZ3MM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858107; c=relaxed/simple;
	bh=jsfEKK2/0h6s1wZzf2U3f8BROR3XdQtn/aKqRUIcApI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBXg5Y01n5+C2S+XsGJ/ParfUQWIdhNdt4rBYrmgCRE2zz41dHrihdnbrUtyMoTJvEluPpf4S9JNXc2tNH3hqA/NbTpIcYF65IYn0BWtYfvMYaOH8/YTUliaPzf+/ZX7VPKQUVAPGeniK5fvbwXvapm/3EzX93AzZntYnQCUjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqZH+dXd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqZH+dXd"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e716e302bdso3073621fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 May 2024 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858104; x=1717462904; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/n2HPYcfVAMa9viMhIlGedEXMDJx4RNXfxIzwMIkJU=;
        b=TqZH+dXd65KS+z18t1En4I/k1myTf1QdUQCZVTrDzARr8YzqLnXc40zN7Q8o+ZcIc1
         HpaitQQrTjdf99vIDGFG8GgG4aF6Q92zTcOz98a0wL9Ju3hiaXddZNMSSEirggQ2AUMU
         5e8lc/u+ERvRSJAQAMEaT/qo08l1ekRDd7XtE1jcmn8uQ4F74j+dcsOhDzDhEYeJcvk/
         kbI4eR9GvnMi7DYTMNmShe2NNCiAauYYSRJkT4TUy8hFcds3MzMXPQ2wpJDPTJUCGzmC
         1t21Eu8dD44TjkIE6BNJZhj4ol0beixgStFqhweRrrI85yEq/B4LKHxIr61DnHR6/S4m
         SXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858104; x=1717462904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/n2HPYcfVAMa9viMhIlGedEXMDJx4RNXfxIzwMIkJU=;
        b=A+/WbmxRifJwCtJqt/S8lpkKx2NXkY6h+lEwnpaoF0OdsVwJFMQhvYRh/1aE5vsnS8
         GGXqzYSniXwaWi3qfDCKX02qxb/srG2UZKMvAiOpLCyXA0yKfRUKJAvEGA0dej+m0zNE
         18wHpHcsGsh80M3fk9v1+oBIcbns8+FcWezLSr/1OUUNENKfLMiRRwtOoiRGGiWV5+2q
         HZHw6ZA4Y6yWegqlv6KxqZyk03xlOfdmT+/5r1RXJzDdUgJzCpsk/g17wRbHw2V+ptKd
         W/b/3HU0G6TJPMIDiv/CvHgk+jV/t4+VNB66d7p+FkQcF6pJm8Q9E5otEWTOO/L3mx9W
         Rh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVwcHXVXmQXG3davzDQZ1VvsZGq1+GhbX96n2bS+gp08vmbqYPJv4hauumgPn05/Z09jqcT5Tuvj7cRa5/JO2Og1juJuVcUes0/lE=
X-Gm-Message-State: AOJu0YxdcGNqRdUMa6Vx8jNwT4Emw6SDa5VTYz0Sy4UoVq4MTSqQbhQL
	l8x+b3gftKprr6dNhQJAlbXqTrLMZm849PoKHU0IUpkbROL9b+ZJAxC4rxlCBHk=
X-Google-Smtp-Source: AGHT+IF9DeTXOwnwxp4rQ2ox7OoaNgJ/aFfsN8eoykusp3USaYLBAH6PtRIs6CcigKQqs8R9SXPflA==
X-Received: by 2002:a2e:9092:0:b0:2df:d2a4:439e with SMTP id 38308e7fff4ca-2e95b0c232cmr60901341fa.27.1716858104135;
        Mon, 27 May 2024 18:01:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bf2866dsm21078741fa.139.2024.05.27.18.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:01:43 -0700 (PDT)
Date: Tue, 28 May 2024 04:01:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v15 15/29] drm/connector: hdmi: Compute bpc and format
 automatically
Message-ID: <yas2tp7anjplld6fxg542i6z7e3mrowy3ex2mb2nohij4kkchv@fp4oi3or67i6>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-15-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-15-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:58:04PM +0200, Maxime Ripard wrote:
> Now that we have all the infrastructure needed, we can add some code
> that will, for a given connector state and mode, compute the best output
> format and bpc.
> 
> The algorithm is equivalent to the one already found in i915 and vc4.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 217 ++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
>  2 files changed, 230 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
