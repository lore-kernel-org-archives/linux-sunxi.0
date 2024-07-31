Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B8034CDE
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Jul 2024 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444979; cv=none; b=OomX+9pm2LOnWAvZ34DUPowiVqTIZBLi0EM+jzOlThWXC0HuxdbfGcTTn6Culmjn9cnJ+7qrUHryM3/gA/iM0v2hP//hUeWwyXUWWCm4XmhZcVoV7tilVg+w+7lpBhjWLHuTlSjMoMBYDSOS9I3IsZtCL1rVWvCRxrAd6jxu0+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444979; c=relaxed/simple;
	bh=IKLHxbuR0R9BOTQTYx5RDen/I6pf12f5piDZx2DS4mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STf4QnmYiYQVTVQL3qP0ZEV9+54NCo2udnKHVJHRgqDLmFEYZwrQIuvkr4Zrz5XQ18qqdicom2NbpgCNBlRAJ4bXPPkwa3AbETqJj7bcm9XO6WzcoZK3bZaEjTHkTmWmTZjNtfKVKnLklwOMrDEzVDQU8mskAsi6MGV8E6+w6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/GqwrVR; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/GqwrVR"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5d5c324267aso3209134eaf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jul 2024 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722444977; x=1723049777; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kcpERRGU5dtW2iPAXxOu8gXnKquzRYp88DBD078J7tA=;
        b=F/GqwrVRx45HmG40GJq3YxplBWdMSrZAi194s8G1UeIKEdPfxqw5UIC/T/iskNLA7O
         ePCrLzSy0PYA57NRf1DefoS2IDdSNj0XZLAQB7eGLPE++dgqVOKfo5jIA/nSRCan9P84
         cOHbmZl6KPcna/zDbEKQ+JK7TcZMJp0oRpoZZ9W7Af7FZOEm8vTKTvrS8zXTqd3mB11j
         vgYDNyHeznBUkU1MMw3ddt+QpPNuWHg1s0Yp7glRRSRsTaa1jWPb0dLUPpITjP3L2NWu
         +mIKPBZjHWbXoc+e54j/SEZGdHgQcEmGtxXfF28UjKzAW6rLpTIPizL6BfD6gmpClBeN
         kdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722444977; x=1723049777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcpERRGU5dtW2iPAXxOu8gXnKquzRYp88DBD078J7tA=;
        b=ghxmG5cuqYocOvtfBcE2xs4D14pW4+lQ+XuZu7akZBVtDJT3IrHJUv0XLd40KnWWPY
         soQsuieOJQOWXUnz/+EXz1UJOlkTLUgHujj9w+5isz0QXtfIxD99QlKh/lLtPg04CH/3
         elMY+4DT761f+miCd089Ett0tTo15PAw7OlMhT5OVzyZzoJGNU7yGawkCgn++b/rDmh+
         H1TsqS4am7p3d18B62lAjwi2BfNkiag2H+lfKFq2NoKFp7TVDNAza2jXYXPFuZffbxaT
         ZNPHCw4CebVmV2X7bGq8n8f2nMQIJb9IGHnEzO+/oW7zoYgB0x45GZVu80Zbtq+JII44
         I87w==
X-Gm-Message-State: AOJu0YyLUK3B0l0Mil90i9jPWObVIqaQjJF4ErrP2ye5BDkOgZjadRZ0
	vCIuQAzPT8YLRD4O7wxK62OsomQfyz9y306L7rK8oU181egdbuykiPo09F3ts9k=
X-Google-Smtp-Source: AGHT+IEufPjRxTWjzgVrtdmJzPJng6hNeQ52ulh+woNrCp/z6nYp0qwQuW3J63AoyMFVNDqa1RjA9A==
X-Received: by 2002:a05:6820:160d:b0:5c9:d9db:6a51 with SMTP id 006d021491bc7-5d61e3e28edmr105432eaf.0.1722444976962;
        Wed, 31 Jul 2024 09:56:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:c572:4680:6997:45a1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7095ad72442sm978393a34.28.2024.07.31.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:56:16 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:56:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] media: cedrus: Don't require requests for all codecs
Message-ID: <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
 <20240731164422.206503-5-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731164422.206503-5-linkmauve@linkmauve.fr>

On Wed, Jul 31, 2024 at 06:44:14PM +0200, Emmanuel Gil Peyrot wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> JPEG decoding doesn’t need it currently.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

Does this change have an effect on runtime?

regards,
dan carpenter


