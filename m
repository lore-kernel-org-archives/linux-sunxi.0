Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311436BFC9
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Mar 2024 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292589; cv=none; b=q7HT4pSi+mrxSMK6EZn2/iCLd/DYspAymqiA8SJtxlAORnhcVLzCy0DPIXRQC95pTUqjlYtadFsZDul/GoQ+x0RrOuvgADZKUaQk7R5fOm2J4/43usEdzJAV3MaUVDW2hBNBRFG6iRnNareR54iKzKuCo0XC2UB4geVWnJhmWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292589; c=relaxed/simple;
	bh=zog0qIVMaTlG1ASknli4b3SB8p1aLaDCqtbud0WxAu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jO77q+tOCIN5P7sK7oviX8+/+eCxvKuDyBlQmcCZVhqWQEdkG+e/+rzy3Mq5D/ciQGdSKxzfCRltwyhk+95QU+bMEgq6aTcDyWp4gxuMe0+RfQSEhNs6QPA2sohfMLzPgYY3LuLcogpj4ezQHcHZUKiBdSJBQAbNRexKBb501UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9pGdZbc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9pGdZbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709292586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRUqDJ3Iv/k5nE0Cga6hqzTdj9gEhtnN2QTBMasCuKc=;
	b=F9pGdZbcEzpk40Ls1JSsenOgFOvaouCHNc/b1trORFyX7Dq7fonr2Nff8u9x0ZoFkeLj1d
	QoVVBc6/JRqybXGnpaBkYPJPvertPwv2lJ3iCnrWqfWxTncuTSCJa5I9ewxoqYVXxPRz2O
	ft3An8HMqP3zlsLD9b2v75Txn+IDUxU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-OcFo-axDPwa2Euje_E5qjQ-1; Fri, 01 Mar 2024 06:29:45 -0500
X-MC-Unique: OcFo-axDPwa2Euje_E5qjQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-412977dd5a1so9555395e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Mar 2024 03:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292584; x=1709897384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRUqDJ3Iv/k5nE0Cga6hqzTdj9gEhtnN2QTBMasCuKc=;
        b=GNTo+tGU9yRdmnmol1V+t7klLTkhq3dEjzLSVHYVOCcexauIC2UTRrxbCtcIVikXC7
         BUCp2L6WR5+uyco+BJ9xS+BFhq95x5rtMTFT1Xf/ChiJBFqHTmd51FduJYtdhL3STqh2
         jcZh+xya4YFqCH7kioK0y8Hu8Ddk7Y6Cql23TX57MviVaxY+5k1wfhPcbZ8ag4W9hif2
         RwmxjICl6dSwN+2m4DLxKpsQtYRDd52eBnjJsiCnJp/btKdyACg8CxVIfX48pfT39VQs
         5hFjzzkige7Kfu7IHuVSnY+uTP1zEMyPZTerVmiGpY+DkuiJfD4e6dbzNt65WdUsIIc4
         uxDw==
X-Forwarded-Encrypted: i=1; AJvYcCViyl+MMHiEASIAxDxyxQFYCm1TYjqv75x9NeuJv7S21KX+sHVS2vHR+qR8Aeq4c1fCIVLRwG3aAoBJ54MPVI2GTXIEgzwpV0XDPFw=
X-Gm-Message-State: AOJu0YyDTF5i2Oyh4Z+z+7ckrYJywNUZ28jFUOdY8PRG7SfHwo7H3uNc
	sMhmxhznS7srVu1YqlS7XFbSsMpK3U0TmTsT59jm4q1SUcVt/z91fOnk7S1HW4HXt9Pl6QOBBtP
	/0ptl+yQUnvJ6DqmxcwJrQ+UoOZkRL0/9Ggi4wVIbSyVTzbDk056YdRaB77Si
X-Received: by 2002:a05:600c:4fc4:b0:412:c8c9:c844 with SMTP id o4-20020a05600c4fc400b00412c8c9c844mr988464wmq.26.1709292583992;
        Fri, 01 Mar 2024 03:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKqlwQ+JstuXu5h4wbg4ZOpZ/dkea6nQ1ibG6iOdPso+qOIY2FCKYMPY6GH4tsyMvb9w+yJg==
X-Received: by 2002:a05:600c:4fc4:b0:412:c8c9:c844 with SMTP id o4-20020a05600c4fc400b00412c8c9c844mr988453wmq.26.1709292583675;
        Fri, 01 Mar 2024 03:29:43 -0800 (PST)
Received: from toolbox ([2001:9e8:89a0:c500:c65:1f3a:8c08:2a1d])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b00412ca030252sm1036720wmb.30.2024.03.01.03.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:29:43 -0800 (PST)
Date: Fri, 1 Mar 2024 12:29:41 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301112941.GE166694@toolbox>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <20240301-light-impressive-grasshopper-adabeb@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240301-light-impressive-grasshopper-adabeb@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 01, 2024 at 11:30:56AM +0100, Maxime Ripard wrote:
> On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote:
> > > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB (HDMI specific)
> > > + *      Indicates the Quantization Range (Full vs Limited) used. The color
> > > + *      processing pipeline will be adjusted to match the value of the
> > > + *      property, and the Infoframes will be generated and sent accordingly.
> > > + *
> > > + *      This property is only relevant if the HDMI output format is RGB. If
> > > + *      it's one of the YCbCr variant, it will be ignored and the output will
> > > + *      use a limited quantization range.
> > 
> > Uh, maybe just say that the quantization range is selected automatically
> > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > variant requires limited and even if it does, new formats could change
> > this.
> 
> I documented what i915 is doing:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_hdmi.c#L2143

Sure, this is one valid strategy for the automatic behavior of YCbCr.
Drivers could also always send an InfoFrame to ensure full range where
possible. The point here is that this property shall not affect YCbCr
output formats!

Maybe it's even better to say "driver specific" instead of "automatic".

> Maxime
> 

