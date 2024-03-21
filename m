Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21E6FC5
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Mar 2024 03:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710990569; cv=none; b=usQpKfOR1oI2Bu8laGwKF9jR/fQOES3wgt7rmY/9BUkckac2cqB64zY9ED+7Ud5TQbT0RtQkRRZb2GRagGYPFKEaFMJTVFvTtZ9dQTs765ggMR6AQGhlIxd6dBpV+cnCTk3gQx1QpeM2M5eKQnT3qm84QhaNdnZ7u9Scy0wpxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710990569; c=relaxed/simple;
	bh=FkzYpBJteeqdIUyppcVF9bTPAo5a25hyFgWuRcXW8/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgS8S+9ovGo+e4Q6KmG44lfazyafEwysVv3Vpi2crnxUKv6HxOblPenLcryj8BeJvveCKK7devCJ6+lUB5GYasL58fzN/P+A3lkiAfZt2oMCR1CAElg1JJi0ROCLd8CA4wLTH0wWSyssFKf1WC6vyDfEazcZLm4BhOGWjT2anw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBAZ8BjB; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBAZ8BjB"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e6775fd386so281357a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Mar 2024 20:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710990566; x=1711595366; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw4MaM5+26FIFeV25IT9vHlMrg0yjNPt8G+THE0Fuao=;
        b=YBAZ8BjBCQ64YWkZDGRnzSPut3yrIuYFIVrLjWySuyS3k5+JPbkIK5iKMA4mg9cVk5
         ggCw+n7eRrVIJXrsKKx+09ubB4hvVR2OlcKF1kRDyur1mUwV2rf0r1y46jvXBuHh0Xel
         sDDHwq25rDFctfRtyfqlsbC4TV0fj4EdT6fRjemhyZo5RWDz4Ck+8gwitYtyhhTFsfOV
         h9e5vSL/FGKj5sW9DycMXur9SenKlxEJI9CfUV/0y/JxtxTAXJ3VsQ1pgnn3qHBLwjOA
         H0w0Yf6HicLWlKPVs7+QbPzdFcBOFc4JrFrm6qYNIW65QQ1cL6kpCptTjaQkYsbUem4Z
         6I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710990567; x=1711595367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw4MaM5+26FIFeV25IT9vHlMrg0yjNPt8G+THE0Fuao=;
        b=L6Hq4gd0U7PCrIXU5DFwL8nhAwy0RusUDws34w92V3sM8Ak4MFVJF0tipk9/UnZi8n
         mHwZXfilV5haI7xFUlVJcTq0svjOwlSqhimdevehs38njfVwiBbfLMMNjIit8F5K7S55
         QNLMQ1HecHLHbzAKDULDKP0QJxkdpXZ/HM8pOnSUK55TcasTCBe2G+UzEVc/cosaDqL9
         GFTQQAQ2sYrpy3v+AsPKrbhDKQFG8PZmPxIugrhu4p0E/pFxyKfbBNpGHebbW9no/E0Z
         VR79KIhWme0h3r7gSMptFv6LHjl7NowRRhjRXE/iFGITSV5k5NMuLFKL5MN0e2EKh58o
         IT6w==
X-Forwarded-Encrypted: i=1; AJvYcCW80TCQZdHwV/R+YG+Phopq/ywIsLi2Mur0+kM5G2mae1xfrec6V9WKsPiE5heB+6vmMCxAbk0OXSrVFWW1kJ5XL0wRUIWtutl7zqs=
X-Gm-Message-State: AOJu0YyG66uzLvigMIl/hYe1rBf8jGBgwoWWj+CoS+eOT4LYe/pEgoIU
	6iDzyvfzdbYGblQMnjdTmUMtsW4zZ/LDahFOqu3NR6ZzFcs9isXI/e5KzTeB4HI=
X-Google-Smtp-Source: AGHT+IGIbn5EcLAYZDaoUG505+Amf/scsMEzE64kDpE2ctwVRmiHQCrFAMGnLRo1k63RMX+6aqG0JQ==
X-Received: by 2002:a05:6870:4141:b0:221:c887:dc6b with SMTP id r1-20020a056870414100b00221c887dc6bmr8224433oad.6.1710990566510;
        Wed, 20 Mar 2024 20:09:26 -0700 (PDT)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id y15-20020aa793cf000000b006e6b9a963a5sm12395995pff.131.2024.03.20.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 20:09:25 -0700 (PDT)
Date: Thu, 21 Mar 2024 08:39:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Martin Botka <martin.botka1@gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: opp: Describe H616 OPPs and
 opp-supported-hw
Message-ID: <20240321030923.4sf3lifbmnvvidaa@vireshk-i7>
References: <20240318011228.2626-1-andre.przywara@arm.com>
 <20240318011228.2626-4-andre.przywara@arm.com>
 <20240320150228.GA1705913-robh@kernel.org>
 <20240320153738.3e2410bf@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320153738.3e2410bf@donnerap.manchester.arm.com>

On 20-03-24, 15:37, Andre Przywara wrote:
> On Wed, 20 Mar 2024 10:02:28 -0500
> Rob Herring <robh@kernel.org> wrote:
> > On Mon, Mar 18, 2024 at 01:12:23AM +0000, Andre Przywara wrote:
> > > From: Martin Botka <martin.botka@somainline.org>
> > > -        opp-1080000000 {
> > > +        opp-792000000-l {
> > >              clock-latency-ns = <244144>; /* 8 32k periods */
> > > -            opp-hz = /bits/ 64 <1080000000>;
> > > +            opp-hz = /bits/ 64 <792000000>;
> > >  
> > > -            opp-microvolt-speed0 = <1060000>;
> > > -            opp-microvolt-speed1 = <880000>;
> > > -            opp-microvolt-speed2 = <840000>;
> > > +            opp-microvolt = <900000>;
> > > +            opp-supported-hw = <0x02>;
> > >          };
> > >  
> > > -        opp-1320000000 {
> > > +        opp-792000000-h {
> > >              clock-latency-ns = <244144>; /* 8 32k periods */
> > > -            opp-hz = /bits/ 64 <1320000000>;
> > > +            opp-hz = /bits/ 64 <792000000>;
> > >  
> > > -            opp-microvolt-speed0 = <1160000>;
> > > -            opp-microvolt-speed1 = <940000>;
> > > -            opp-microvolt-speed2 = <900000>;
> > > +            opp-microvolt = <940000>;
> > > +            opp-supported-hw = <0x10>;  
> > 
> > So far, we've avoided multiple entries for a single frequency. I think 
> > it would be good to maintain that.
> 
> Fair, I wasn't super happy with that either, but it still seemed better
> than the alternatives.
> 
> > Couldn't you just do:
> > 
> > opp-supported-hw = <0>, <0x10>, <0x02>;
> > 
> > Where the index corresponds to speed0, speed1, speed2.
> > 
> > If not, then I don't understand how multiple entries of opp-supported-hw 
> > are supposed to work.
> 
> If I got this correctly, multiple cells in opp-supported-hw are to
> describe various levels of hierarchy for a chip version, so like silicon
> mask, metal layer revision, bin, I guess? The binding doc speaks of "cuts,
> substrate and process", not really sure what that means exactly.

Right. That basically translates to hardware versions the OPP will be parsed
for.

> I think currently we cannot easily combine microvolt suffixes and
> opp-supported-hw in one OPP node?

It should be fine.

> I think it bails out if one
> microvolt-speed<x> property is missing, but I have to double check.
> But IIRC v1 of this series somehow pulled that off, so we can maybe bring
> it back? To end up with:
> 	opp-792 {
> 		opp-hz = <792000000>;
> 		opp-microvolt-speed1 = <900000>;
> 		opp-microvolt-speed4 = <940000>;
> 		opp-supported-hw = <0x12>;
> 	};

That's what I thought too while reading your email.. Just populate the OPP for
both 0x10 and 0x02 versions and let the speedN thing get you the right voltage.

-- 
viresh
