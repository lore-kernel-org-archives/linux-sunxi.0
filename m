Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D44FBF0
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729398016; cv=none; b=VUavkRPu4nA3AgWEIl8JyR7CQ906oIAMXjrlcN7u7LhSxEiC46JxqqqKnKUfs6iIhZXD0sMFJ7CAhFb38+lRQ/di9Xzfx9hl6fsZ5W1iBqEnb2hESSJJ2S6ypRNwNL6kgd5700lercF7sFttpKmmA9UGQ0+0GbMZtAUBLtsHJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729398016; c=relaxed/simple;
	bh=ucoKzAfhP4N1DBoA72ymTI/rTVDTjLWtsVOIvJWbPsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqI6LWsqmvDTU32QxfUSTRgNC8xEtPqOCLV55/5YW53Fx8fmf+KighiVDnFJzVuAe47QS+4MFzJ+xiljBV3GEdGd2AVKhZ8s9JL+bff4Y3MhSa30/8F4Vu+s2oc3H5aG8jW6WrjjGw/HVrNrWXL1ANUvjFqiY2RGf7Cg4Ik28mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V583O9sy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V583O9sy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cdbe608b3so28115295ad.1
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729398013; x=1730002813; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tptjKfYEQQF+U0/Q+FaHDkTW1qtsrHC+9O21DSZ+nB4=;
        b=V583O9syErTVTAAW838DsApyi15g1yzof5uCMLSdKPx3fmQXC1y/CLQV2ovBTn6yc4
         oJ5nYLcQNnBROynjJTRPJdZeMPRiW5rY9StYUbruwih/UVARYPp1BTERA8GxeJF55fhw
         SU8KwzQxx8cyx4wmxiVMClSu5p7FHJzlMGbOhb3BBVyzISnYXT2G1wf6cbbW46uHuHq5
         CFWGSnJ412RySRfXSTwjgKFqn2vd4NXzbILLng9OKvDoDHa4HOIF1Jj4U/u+upi+RSmN
         JIg9b15jpGEZ8m8Q3gI+y0O4UH1OunUAIL4GdHV3JcbHlIf3wMRo+J3phD2LMiJ+veZx
         IFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729398013; x=1730002813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tptjKfYEQQF+U0/Q+FaHDkTW1qtsrHC+9O21DSZ+nB4=;
        b=dP0AzG5eqsFGMX873npSF5ck6DnMOrKyPGCF+0sbjh4vxbH+/XZLTepASmn49/+8cA
         umGh8jZtFaM4iOeFRK9zeevojvToO6StB9XniYERtLKTJgtABFKX+rRlNXdepHivhVvn
         QnKg3dI24UUkHgMBf27SVnncZTxnsRXJ16Dl0uNQPdXy/4TwPAlzKxdvf3tRjF1TBoUs
         NVmtkypty6HsFqulsbZtMwxslOWZ0T8aX1RAF4544/CE7kYvUGisDyXIs7tVN6bGuoZF
         GjYpDtDesuIzY/VeW+gQx+EOYrTrWEETEPZvmYErf+7Q6bgLnfxg/34+JtqGtH6+EjAY
         hZvg==
X-Forwarded-Encrypted: i=1; AJvYcCX45pWk9FtXYQd4D4PEvMrYI5meD7DEx7OSU+WMOrzRiOyDALAVeBgpaEzlvMluzD+8jIPJrCmIoPcY8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzia26OgajJTqmweACUapqJOWI5bwS01nqfD152hCakju7Varcw
	GF9M99B1hx2Rqbl8IRCcx4SX/9tkjdR1VNC75d8hhKLQyLcYRWBq
X-Google-Smtp-Source: AGHT+IH4soPnB60xIfxMOaiMsildnpr5Xj1NAwq8oNtm2eFEI+8djQ/DtBOvtVOIoBtzygMoxkZyLg==
X-Received: by 2002:a17:903:22d1:b0:20c:5cdd:a91 with SMTP id d9443c01a7336-20e5a9338b3mr105516805ad.41.1729398013446;
        Sat, 19 Oct 2024 21:20:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee3c88sm4452675ad.43.2024.10.19.21.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:20:13 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:20:10 -0700
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
Subject: Re: [PATCH 09/10] Input: raspberrypi-ts - use cleanup facility for
 device_node
Message-ID: <ZxSE-iBTWc2ZRfik@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:59PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry
