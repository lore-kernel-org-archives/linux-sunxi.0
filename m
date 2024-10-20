Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080C11713
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729398027; cv=none; b=WAwg+whr+oLkd7GMojgKBGCrW+TCcAZXJLt9ZRzQRtDEC66fdmDrd3BhOjPry+ZlV3lf48+IS7N3MQGEryOsaYTbk8gKbBti26BRYyUyIns/VvjtE7r9VhG6TmZN/GzuHdx48Er+ALhqSW0H7QDoh7nzwr1wE6rE8IkqMmV9Gtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729398027; c=relaxed/simple;
	bh=LNHACedYQbx0cjfOb2FnneuefkB12VYRlcpJPj8EcVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2elpwCeuWGuqpNiKkcp2xuq+nTuGxwuEM3iO7XIOl/D+LlAJxaF961J3XoHfL1aZ9yL89D0SOgZZRmloCpWBPN9HrKXatVa5nnl6O+dq3P/8PmR5NmTMoVLhRWpfQPec3tvVfKaAtGfbtWnGV2HVD2+xRrNd8Q6dLRdqokeD8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G35yOJrW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G35yOJrW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e31af47681so2768859a91.2
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729398025; x=1730002825; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPX042dJwNsDd6EwKBGzToksDykTZ4Q22JDteLvPDCA=;
        b=G35yOJrWbgAJXiTYZcTmpd2LT/+IpYtvlQZAYjKaX9iPKpj1EBMkKkN06fc+0C9p44
         V7/KhLioyJcy0iLaJJ2UOia3qvI9DjSDFhd59SLjctVkYTUgo+mu9l2q7dqMirCjoqSf
         AOajNId4UeVxaexLAjSkmyXb1OZrgEhIz3e92PgWXpXEcUdbCHAAKz/TzKtG+7JyHUHm
         3HxHb9xJvKtZV1VFcr/OP5OAV+bGePUaiVx10rvXHixi5u3X6LsIrpJIG+temCazK1CM
         oVt3CfTUavxcmd85w57+wHOmpLZ/1W1Y5/n9lfe+woyzx6ScG1ChIFk3jio4nFZ6440m
         VlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729398025; x=1730002825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPX042dJwNsDd6EwKBGzToksDykTZ4Q22JDteLvPDCA=;
        b=CGZIwh3rAcO9DlAbIpY4RkWb9029GgDMc+pWcHQN1lS98qu88oSg7Q5pVknliubMlp
         1z6owf+Ah8LkIVB+voWW6XPiYnHnMGcvJF9g/3MQOATarWACbMSWISnMA9qTbUuDgWwn
         KofPSmhheqBqZw59A5Sk/fo+yMXTJt6SV/YdfUUWs/6NBoY8KQNRrxQLVvCJcPNwDVJt
         6QlBDAe0nj6yd3CQ0qWwkygfEb77ItaBXiWV54oTc70aC2yakw2HyqfjeZJ0L9yO5M74
         2x8XBag6YaLAoKpt7hw8m6OYqLgBgq/kJc+AbeLEu4hs7cW4Oq/1PuG6FjNyMjBUQxJv
         D28A==
X-Forwarded-Encrypted: i=1; AJvYcCXRVD04xsAYZe3WBIoPfwj+quM/Y02MFgvyOVAXGsJZD+ypxxII7rNq90oPECwWqc/moXbYS9XdTE75KQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn8yYZQkbuia4vRoq83pYFsEmxn6YUdnV+0iAD6kGpUY8Cijm/
	lIAbStWsvstzdUmnDRBQVp2FHY++Ld9NX0xajLBy8nWiXT14LDdcjIPewA==
X-Google-Smtp-Source: AGHT+IHA6YFEqEtg61PXYGVgACwL+Cintoefuk4OglOjvjRf+3hwgSbRVFqdWX6TDCZbDfVBCqjZbw==
X-Received: by 2002:a17:90b:4b03:b0:2dd:6969:2096 with SMTP id 98e67ed59e1d1-2e561a230ddmr8389123a91.38.1729398024690;
        Sat, 19 Oct 2024 21:20:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ee3b0sm644120a91.42.2024.10.19.21.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:20:24 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:20:21 -0700
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
Subject: Re: [PATCH 10/10] Input: ts4800-ts - use cleanup facility for
 device_node
Message-ID: <ZxSFBbo5sO3w_9sl@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:26:00PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry
