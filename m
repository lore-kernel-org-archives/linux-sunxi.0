Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18241AD2D
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Aug 2024 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724310275; cv=none; b=kcjJQk/xA128oHq0q5LYCs7ADpYh1F7U2+8+quieY3ZLzMUHzMarIF8IEcyTqHDD8wnihWQzSSWqKdk78PRMUzr66ETfSj4RPIpRxNqbuxRORsXzVVuddNloNgut3HuRjt5EZjViespegCxSvBizyWNRFIJ7ggVjX4IycAg3HgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724310275; c=relaxed/simple;
	bh=mM0y7Z0DIHWTTmDx6Rm/W7DoApVhDQcDSS/iGPnPrK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9YjWemYPW6meQ51fQTPPWTCFAghryeqU5KWGxBXfVagKDMfrpQZMspk7zvq1340AnXY8HINy/0lMRFb4qPndSsEvORkomBI9mnlTR3Cy6ta/TDQ3paF0Db//dkBYJXRL/c5+IFzmUWlVFZeRQos2tUuwsNNCW3ENjFbiTN8h6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3719f0758c6so200881f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Aug 2024 00:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310272; x=1724915072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEZWRktZ6NYhFEZsZ7jkGwIJJMbDxgc/00AXg7Us/Ds=;
        b=VEKypED18aup+XVgqE2YBBVmjULqnBB2/wUOUpktWN5uP5Uld+0zE8+2J0UNhbc2tP
         jpfQ1QZ2heN0LmXWGG4Mj4RHBbd3aNHYisM+8uIbWQWW+cxV9PvYUYGoo77TjMP90K3s
         cv3+Gs+UccdpZz1yQF+yZShNa8SN9mfbZLVk6hpuAoCEiddmYE7EC/F3pNp0WqoBlY6e
         tm5qsDVr8mjdc82GTaS7fOFVOTGLNcedDZAK5k9jIiM9SU9GBblFsdI/k0tN4XrxxGaj
         9weaxKQsXzVoMkqUMOAoLibr8IsT8l2f5Q1lyYsoJswdx8DLV4Hs0NiuMsUsJig2RNri
         e2dA==
X-Gm-Message-State: AOJu0YxnEKPo2fOxo02cLBBbRH35yFduPukxv0TSZqzscQPvSL1qTDMJ
	kx5Z5up6b5Grjo5lbRhmd7vHsp2kbO3Ktbxpo05WYnreU3tPrmj/
X-Google-Smtp-Source: AGHT+IHdlIILj+2ij6/76YdG9myYvO9zjSjkTKzXWmbVpdNNQ1myj4K8HPubntkMJkrcm5OdS5CtmA==
X-Received: by 2002:a5d:5e11:0:b0:373:549:bfe with SMTP id ffacd0b85a97d-37305490da6mr858381f8f.50.1724310272274;
        Thu, 22 Aug 2024 00:04:32 -0700 (PDT)
Received: from krzk-bin ([178.197.222.82])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42ac517a4c9sm13673865e9.35.2024.08.22.00.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:04:31 -0700 (PDT)
Date: Thu, 22 Aug 2024 09:04:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, 
	quentin.schulz@free-electrons.com, mripard@kernel.org, tgamblin@baylibre.com, 
	aidanmacdonald.0x0@gmail.com, u.kleine-koenig@pengutronix.de, lee@kernel.org, 
	samuel@sholland.org, jernej.skrabec@gmail.com, sre@kernel.org, wens@csie.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, lars@metafoo.de, 
	jic23@kernel.org, jonathan.cameron@huawei.com, 
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 05/15] dt-bindings: power: supply: axp20x: Add
 input-current-limit-microamp
Message-ID: <okthxpzzdduxwkgjzxi6njpkf2w7fjswi5gqhheji4owvmkkg5@4rmyye7i3np7>
References: <20240821215456.962564-1-macroalpha82@gmail.com>
 <20240821215456.962564-6-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240821215456.962564-6-macroalpha82@gmail.com>

On Wed, Aug 21, 2024 at 04:54:46PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Allow specifying a hard limit of the maximum input current. Some PMICs
> such as the AXP717 can pull up to 3.25A, so allow a value to be
> specified that clamps this in the event the hardware is not designed
> for it.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

