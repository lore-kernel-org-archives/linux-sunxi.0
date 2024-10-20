Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BA523A
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729396810; cv=none; b=UDCLHrdr3vpCJnik7FADs29OnhOs/qNb2v+CADFkTMqlevZyV//DmL7Kfp07XnEDL1FWsqATJq6Es1HH2c1hd4zEMVF4lJxAfwPZl1x0ZsfL8vXiIy4MSM7QGsN46d5ChRk+7AeIbFo/HM75w3kzAXZQjwL0bF3YC1n8TBfXmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729396810; c=relaxed/simple;
	bh=gEx0+sNstjl7kYtDsIxoAcDh6XLyp0bU/EG6gaF7Rzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ0el8FrGfEJ0JjhKoDs7b5tDHm7IGzlcMHNHITViq1F+89Z5tA6q9X5zuWi/lmsmrdbJu9kBMSEVBl8BNvUzrz7DIughbxj1aDDTBnLwL7X7I8Kraw8V5gaGn/QZZNlKlmQEqTQFpxXDPBta4PawC2V4gnpU6jAqgnrmMm3q4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQgSaGEn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQgSaGEn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c693b68f5so36169265ad.1
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396807; x=1730001607; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7Eyn+wIU2lg/soYhO35E8VzHPCZvDEk6KGPQpopCtY=;
        b=bQgSaGEn//NciWN0w/STSvKnx/bvqjQAfyDAztPGwqlOTLM2I6bJt2JT3BmCKcTllq
         kjTJFrGIQfjUKNkbM19nBx6iHPmkX6fGQwblgkfw23OdWCYCcseT+ziCzrduLt8//17G
         2R9KRw2/Qq9JRoT66sEbI33rd70UIAFjqp5J8OGdvO/d9gNTt/NrZdqdVRsf1N3IU3Lo
         QEDUU6glps7FhOCw3hIirDT2fHX1cfN2eeaj0dWEoh3bxbCw8E5LE467u+Wo8yk2dr3Y
         2a16GPQlEc1L0g4ZJJeGi9By04KsSDBQ30vpY76VhPdgZH298+OtIAylAAkipTpXtogt
         zjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396807; x=1730001607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7Eyn+wIU2lg/soYhO35E8VzHPCZvDEk6KGPQpopCtY=;
        b=dAgK6G76GRB2XcEQ7LXBqJdMQTtumpDZsETzWVwSUxBm+E3GqTP3xxqEymKdE/y4+d
         wyVkBlfYDVU+ci/Is7JoffixFJSir4pGKnKXtgGexdXdIdzLKQco4T4nkdJXbk355LPa
         xF1vYRiW0nMmXcuySQ0SV3xv/gP+N9DzWrF5+r3KfbqSDkUJRla7iOd7T57tv5VBXPH2
         +xgM+KMoBszSk3FsQ1nZ428Kyc81FZT6nHj94jX95NHtBAdipRpHIog8vipO3FZmV0Cu
         fo14syinOIttrI0Weq55urIIWn7venCIAXbD1Ihj9xQPgzCancsFQ4l2hl+2e+OQdddQ
         vEHw==
X-Forwarded-Encrypted: i=1; AJvYcCUIfZ+m4HXq7D3A0DUNIYQgwWaoBVVFTBppMTNXLFnu54OnU+rTH1i08kdaYiA4Hnmb1uD45+Dt3/cX0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhP0PtKOc+0CuZ72IsVCIhy6VWpqUyJDWAoJ3gArjRdQY2yKet
	m41zvOcXvKXVYgYJqwF7sufhVuDFors9AM+jB1DTHfRbqKFbqWO0
X-Google-Smtp-Source: AGHT+IFl8N79KwJNzpiOSvPNhcTmGipFG8auJpRWECmsOLXRx2Y646qdQOyM5pwoW9JzQIeTiIpfBQ==
X-Received: by 2002:a17:902:f68f:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-20e5a75a5b9mr91972725ad.18.1729396806850;
        Sat, 19 Oct 2024 21:00:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bf197sm4182235ad.150.2024.10.19.21.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:00:06 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:00:03 -0700
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
Subject: Re: [PATCH 02/10] Input: mtk-pmic-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSAQ4rWWapwWMRC@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:52PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry
