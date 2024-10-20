Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94E8462
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397956; cv=none; b=kp7vOLGTasR6ocCOlmfvZo4J0a2Ige/BOuYq9pqrQeapEtu1Qb+KbKcBngYWCjtempjj6ExC/qa3tQi3TeSkJGiUejY84XcLwHxZxwRCnvbQGqBq1mh112vOv3M0xeaYlJIn+ERJJmY5uUUX7Va8vrdVo2Hr4JOLkxeKDqeecHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397956; c=relaxed/simple;
	bh=JAPjCbky3JM4Js30HaLIpXoOk/qpXtAc5ZgQZI0Nim4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raCgOcPoiuW8NjBFQyczV8HD6GA8+cjgwh0OIDbCKFSlnptBRPOVuS7hdmsOwUCCegGSxgNdO1rXX/SQWah/nyrs7bzcWoc67Fh6xEUYAWoW3tAyboYms8njxv+u6p3Yv5/Q1J0X0b7C91cTcP3Z/nBCrF0+iuqbq4Z9/8f3OJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTWolo5z; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTWolo5z"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c70abba48so27694135ad.0
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397953; x=1730002753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdxAZPP8tKBd9xy8wdHQraowerxPEW9BPsKjH3hJ3d0=;
        b=HTWolo5zQFTRstaH1luur5FOERhMiLNswutzDBZA3j1ZmM5kXqg9j/8rmgvixnqww8
         KcBDZhdK7VLN+H9XLWUIIf0lbIl121isc/VqRayNXpTz2xSCperCJYN5bY+3MZBVl+rF
         Kvv4PL+TP/e3RNdxq2J/3T3DXrPR43QYCNWsAzTFK+d3rHDeeut9gLQFaDuleDT/IHll
         17yPUeoaiAVpyVuwSmC6nOCA1zeSViXPPIq01hioRZ4Hdzugk0r6HK8fW8lR8WpRt2Zx
         6PUUHzxdkOI4gDhFqrwJKlspahbjTEqZhDbe0KzukBnEf5YhHSYSCG7X6VxM6p32TI5F
         NV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397953; x=1730002753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdxAZPP8tKBd9xy8wdHQraowerxPEW9BPsKjH3hJ3d0=;
        b=VC+iRNGyiU53ZsgI2hqOYSnlH8mmVRCZNOi2KPQ+4Htv+kEuN/Cd4/uMdSeaHuO3G8
         KFHH9OlNpOPZ3NFp3MWcLSn9ngmLRkAaT54Hy4rgb9IM1rt/O8U7IPC7xCZpvy6RQKJe
         R13rQmiYFn5RsrgEYu4/yCDfcA2Kxuqtiamt1OHlDr6xwfjOyPAE0MJqOjZQxogujUl2
         4TegwGoz2qJUqXONt4XLiOddz7dbuOu2ZLHbDNkXuR1J9Y37joZSiGNLpMhIMYqcdl84
         4S2syjqDuvs2K9eWS7Aq5v2wzVPRSbjWGNOLlOKRzyoz3qrmojonEA6uVFkeU6GBdb3v
         BTAg==
X-Forwarded-Encrypted: i=1; AJvYcCXwFJm2vlY7kLiQXH6lXAhm2vaU9MCIb9vpncD9M1zA0YS+bpGb8uehJPp182NKqNWCMcn5c934kZwh4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl1YyT99J4Q/vEQlODmnW2WbojnbtD97ir1ljy4fTXx0HXxWj+
	DWo7nAAXvNKqynNKgIKSp76MdS42YrIyFQ12u2Voz/yYXU4cV4bK+g2gaA==
X-Google-Smtp-Source: AGHT+IHBIvWZ0uV1GR/m50ZQ4x/Hdm7GgkdXXrNd1kKqUe+bkuGv8vNm+r2H5ifXOrMUDosuFRD+2w==
X-Received: by 2002:a17:902:e811:b0:20e:55b0:35f2 with SMTP id d9443c01a7336-20e5a737077mr91778295ad.1.1729397953103;
        Sat, 19 Oct 2024 21:19:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab35f8dsm545377a12.31.2024.10.19.21.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:19:12 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:19:09 -0700
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
Subject: Re: [PATCH 07/10] Input: 88pm860x - use cleanup facility for
 device_node
Message-ID: <ZxSEvZK-1ydmUIxI@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:57PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code and error
> handling. This makes the code more robust by ensuring that the device
> node is always freed.
> 
> Drop the first assignment to 'pdev->dev.parent->of_node', as it was only
> a shortcut, and tie 'np' to its usage as a child node.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry
