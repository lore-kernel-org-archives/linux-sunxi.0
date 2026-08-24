Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D33546D8
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584573; cv=none; b=nZAuZCOIxkVg6xPax/5EjXDOr4krdIGWKGJVxZgEf7YbsWZ9QDf/6ul/a7mQPvLo5/DciN4M7odRym/IB6ENaOMCSiMVg5rTVTFUgDfYL/MygXa90zUizyWOPFQqgDayR3dEq8p4z5qT23chVF0d1cJZLryK1TwcgfDCxtk+pTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584573; c=relaxed/simple;
	bh=6bkublHg1xrci+nJCRQzK3DlrDkjAVx27Om/QoC/B2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Wmv/M7cKBa4T2hj6Itw5T2hfEcxYuJd3kvOrL82fXdgGQCmcl0doiP0se/jdpXgUhPBA2XKjz7KYXrv9H2ePXx6nXwGbLNnfNrSgdGGa2+gkM3VUOb/GWhCnI2OHalBk5W/HDmEY9k7nsw5utFlQ03Wg04x7oVTuyXZBjEWuqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H+keKXBE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H+keKXBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
	b=H+keKXBEf3cpapo+if/3cZsXtTbODaE5/+atLhBJ1DCGEPRSrcxixX4ZwltaLBXJCopmbg
	o7qyk3DWbQTYCCGspn1oXwzIHKnk23E3R1UPhQPqQeyw6ELK3QKnkwtjXfYwMoPVCRExSY
	9JmhLkYWIoju4WIomF1j7UX2cAFCRCc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-9r5sBN4yPBiIUarPMxrbZw-1; Mon, 24 Aug 2026 11:16:10 -0400
X-MC-Unique: 9r5sBN4yPBiIUarPMxrbZw-1
X-Mimecast-MFC-AGG-ID: 9r5sBN4yPBiIUarPMxrbZw_1787584570
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so48753941cf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 08:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584570; x=1788189370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
        b=bQ/Ko35SfBIig3qNEz/eMrfot0raPbQ8goS9xj0i6mioG1fWu4kt5Be0c6nZ1n/nHR
         SobMr+zRBKNlySzp/FMsfOWZT2hQwomoT/egunR8uGGYAbRUP5+dl/WLrBPvqHWf1j/z
         y8xCyLcvPIrATE4CBMx0FrmdNtSWTQ+mgcxCgiMHTX8lN23GsQ0FnoFNnEsMYlF/NR3e
         E/+p6k1Cb/yslR50Fon9uj/hpeZxFahLBpdu0Y7+zlO0q5DGA4fuCbTzrA6MKRisrF16
         Tm5NoaXAgD6MnOGF4Z0DeJh7IQPEzjNTigUpksnq+9Ivy4jjfbYyCuM37dTLLvlBuZc+
         39UA==
X-Forwarded-Encrypted: i=1; AHgh+Rq387I8SS7ZzDJkpWW84KL21n8kj6MNGJRTwJBQ8eBwdIiVvabjJ04vlmpv6BPFMyTd++UqhTma50Gxtg==@lists.linux.dev
X-Gm-Message-State: AFuF++m2eKeEg7IbiR7oXIYVpJwMuH6cK8eheHUVyKIikHCurrfciVm9
	9nhcvdUTHZSr2IqCy7c51mv7b12yxoirA3Ag6VWAoHLV7NbAuQtp2ZZVI95OpmT3ZEHDoFzulpG
	ZB4Tr4v5T0Hs28z1+pVM+twT7IiGUyr5N4UI5+sH3TFDgoRYqscbXUXfHaI0sSEgo
X-Gm-Gg: AR+sD11BTlaJN8yK2RIwhQHeEnYgsxsyS3nJstZdiXl2n9hkllyoyBSMiPzqTv8z46I
	749SSZIf+Jz/9Arf6JwmVXCKW/BP4sqaD9jpZGToqy9yAtfmW0sczqN9vSxprzKnst70LMJy1WY
	/5C3swR0pQaDhuAc0Zj7Kb0ncvNT88L7A8dyH8K8Y0UT+EZKaWaQ4KTe+K+w31n6arg2KTalrTq
	G4f1E7yaUDGkovrjjvxg5c4jKkcL8gWavb9geqXTr1TEYy0ZRIhFumCgcYVcdG1EPANmsv4UW3V
	alY67epHaIgmsjURs8bFh5gsvAf7LvG9jIpvRR3yIVrifIFh+cCi1PaTJ59YKWFEYDzTEPH66Gz
	C8KzmQNEbJzHhN0U2KVB9j5YFPo/E3Qd4Imk=
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279729861cf.8.1787584569723;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279728951cf.8.1787584569268;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4c1a1sm63772856d6.34.2026.08.24.08.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:16:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:16:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tegra: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgM9vY01nLeX_f@redhat.com>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fkxzSQRCb5v6Bm9j7Py6fLT9XhkOh3sxuAr9YN0tnvQ_1787584570
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 12:03:03PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

