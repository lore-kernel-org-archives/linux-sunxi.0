Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27815194A75
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494911; cv=none; b=aa0K8VdT5RJJh/+5hLwae2YRMiNLpe/Q+CBlbQQicQg+/8ZcoI15uyOBYBS9sPFk7SubFUpoND0bR6mqk4AlhYXkZwU0T14plEw+LfW3PhfP2AsXGL07X/Q5EGyItcfmbRHsMOln+fQv7NaIF/W+CmzsXX3ZpHy44EEM1danhP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494911; c=relaxed/simple;
	bh=dc6pUqfdXdJQEF4Ix0lfWE493NJoqbb52K8H6be4mb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7qIREZpEt7V5seWNqswj6+MbayXhmEaRBb2GvWmaTY5b+cV2Bm6bIoV8+ERhzjtJ2rZOjsvTCvJ1i/jk+9poguAtqVaYputCzVSmGgxHfvWNI4Ir8u33R4x91BeMU9ggawDFicMqK7SdFjIEAYIhJ9TRDrKt5iz5xbuKayOVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFtWtUZx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFtWtUZx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c9978a221so47573045ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 00:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729494908; x=1730099708; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=smZfrGjVtvMSg3iZLlvbi89YS5i9FVGvaFb9EE1aWv8=;
        b=YFtWtUZxVXA7rkoLIuqh12fx9JEbTnufJWOK8A4tCBlg4FQmcECMvnj1Af4NeS2Jhh
         1rJ02BLkLBt6oQWxiACU8enVaWuaIL++gZ/HjsU0xZEpaKwoplB1UWMNWbwN2XxfCRy6
         ybT+hLhhPG5qMoqdiqhZ0gJ3xET2tUGTQR9TzNkQ+xRO1Lt+jkHKSSc0abUTTI90r7V9
         3x6TjOMb8+1/N4ZSyQmw/gIIzUawgq1j1va1ttAYql2TUevgh/ZhB3ocxnCXcq57o/90
         3mAKpZKv+64qCFAJukn1xHN2kNbhi2GkNzt0n/ZVs9okGHovDgsPXtqqoZf0cQ8OYDdM
         y2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729494908; x=1730099708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smZfrGjVtvMSg3iZLlvbi89YS5i9FVGvaFb9EE1aWv8=;
        b=EHgJ0Ste7Ypl/KqpYuWtn4GTXoy7suaJQNVEgEefJH2GpHtQ19ABXXyXHH/NB55f24
         c/c1L4qNHZd42f2ubigG3FNrrXR5KE0rpcs8sOyB2l62yfZ8uiDDjLzzDg0ewoBI0HWF
         vyopLAWKgz8ouLLHShLwjxLmTWopbZ8BMBLDoiyhlN5uh9et6whm/ytCI+z5WWXrYLmu
         zhJyX/JX5RueF6fdjdxsw9ab8uJPlJ4vu3XfO+Dy0Sq8zQ9SYVhZ4RuSq3ebqZfOw4gj
         O0L4xXSbB2XfaRR10G2QOqRVeMYquwEYanYmLDQr0mx9aC4DvDqPenixWZoQITWI80xn
         H/6g==
X-Forwarded-Encrypted: i=1; AJvYcCUC805JAtNcxqCBrPSWqcV1e67yUrMq6ao758cHMI8278fMHROekblYAoy72z1hQx2ZJHcVSQuKLaVcbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb5cjBijBhLgPYorpPSpl+9mo3A8dWgtl27uglPolJAWbHJWlR
	rFplVa2IgMULU/7PEQAnaaRMyJrtJZkSX06zFue6hQZ7zHrLJ4eb
X-Google-Smtp-Source: AGHT+IHy2ChbQeyZrKCx28/8OkE6XbQjadUgTgmofH8VjxpMdlc/BulLZcrsT3LIRUIu1mJy2aFspg==
X-Received: by 2002:a17:902:ce07:b0:20c:c9db:7c45 with SMTP id d9443c01a7336-20e5a7604famr168254115ad.20.1729494908190;
        Mon, 21 Oct 2024 00:15:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6e21:7092:f7c7:3951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0d6besm19607365ad.104.2024.10.21.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:15:07 -0700 (PDT)
Date: Mon, 21 Oct 2024 00:15:04 -0700
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
Subject: Re: [PATCH v2] Input: sparcspkr - use cleanup facility for
 device_node
Message-ID: <ZxX_eL_hs-_eKW0h@google.com>
References: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>

Hi Javier,

On Sun, Oct 20, 2024 at 08:27:13PM +0200, Javier Carrasco wrote:
> Use the 'free(device_node)' macro to simplify the code by automatically
> freeing the device node, which removes the need for explicit calls to
> 'of_node_put()'.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Changes in v2:
> - rebase onto input/next, drop applied patches.
> - sparcspkr: drop goto before node declaration and return -ENOMEM.

Can we switch the driver to devm so that issues with cleanup and gotos
will have less chances of resurfacing?

Thanks.

-- 
Dmitry
